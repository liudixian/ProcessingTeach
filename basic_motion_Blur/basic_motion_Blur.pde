
int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5)
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}



int samplesPerFrame = 25;
int numFrames = 100;
float shutterAngle = 1.5;

boolean recording = false;

float zoff=0;
float n =0;
float percent;
int totalFrames = 60;
int counter = 0;
boolean record = false;
float increment = 0.01;

OpenSimplexNoise noise;

void setup() {
  size(500, 500);
  result = new int[width*height][3];

  noise  = new OpenSimplexNoise();
  //frameRate(80);
}


void draw() {
  if (!recording) {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  } else {
    //背景色 黑色
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    /*load 过去5帧的所有像素的 rgb 值
     并用 loadPixels() 将像素储存
     */
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      float percent = 0;
      if (record) {
        percent = float(counter) / totalFrames;
      } else {
        percent = float(counter % totalFrames) / totalFrames;
      }

      draw_();

      loadPixels();


      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;   //r
        result[i][1] += pixels[i] >> 8 & 0xff;    //g
        result[i][2] += pixels[i] & 0xff;          //b
      }
    }

    loadPixels();

    //二进制运算 将 rgb还原为比特数组
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 |
        int(result[i][1]*1.0/samplesPerFrame) << 8 |
        int(result[i][2]*1.0/samplesPerFrame);
    //上传所有储存的像素
    updatePixels();

    //if(true){
    //    saveFrame("./output/fr###.png");
    //    println(frameCount, "/", numFrames);
    //  }
    //    if (frameCount==numFrames)
    //      exit();
  }
}

//////////////////////////////////////////////////////////////////////

void draw_() {
  colorMode(RGB, 255, 255, 255);
  background(245);

  //stroke(255,10,200);
  //strokeWeight(10);
  //fill(random(255),random(250),200);
  //fill(255,10,20);
  //point(250+50*cos(TWO_PI*t), 250+50*sin(TWO_PI*t));
  //rect(250+50*cos(TWO_PI*t), 250+50*sin(TWO_PI*t),40,40);
  //ellipse(250+50*cos(TWO_PI*t), 250+50*sin(TWO_PI*t),20,20);
  //textSize(36);
  //text("cao",250+50*cos(TWO_PI*t), 250+50*sin(TWO_PI*t));

  float percent = 0;

  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) / totalFrames;
  }

  noiseLoop(percent);

  percent+=0.01;
}


void noiseLoop(float percent) {
  //translate(width/2, height/2);
  stroke(255);
  strokeWeight(7);
  //noFill();
  colorMode(HSB, 255, 100, 100);
  //fill(180, 70,80,10);
  beginShape();

  float noiseMax = map(mouseX, 0, width, 1, 5);
  float c = map(sin(n*10), -1, 1, 0, 100);

  float angle  = map(percent, 0, 1, 0, TWO_PI);
  float uoff = map(sin(angle), -1, 1, 0, 2);
  float voff = map(sin(angle), -1, 1, 0, 2);


  for (float i =0.0; i < TWO_PI; i +=radians(2)) {
    float xoff =map(sin(i+n), -1, 1, 0, noiseMax);
    float yoff = map(cos(i+n), -1, 1, 0, noiseMax);

    float r = map(noise(xoff, yoff, zoff), 0, 1, 50, height/2);  //3d不循环
    //float r = map((float)noise.eval(xoff, yoff, uoff, voff), 0, 1, 50, height/2);  //4d循环

    float x = width/2+r*sin(i);
    float y = height/2+r*cos(i);
    float CCC = map(sin(i+n*4), -1, 1, 40, 80);
    float CCC_ = map(sin(i+n), -1, 1, 30, 100);
    stroke(180, CCC_, CCC);
    vertex(x, y);

    //point(x,y);
  }
  endShape(CLOSE);
  zoff +=0.001;
  //zoff +=random(0.001,0.007);
  n+=0.0006;
}
