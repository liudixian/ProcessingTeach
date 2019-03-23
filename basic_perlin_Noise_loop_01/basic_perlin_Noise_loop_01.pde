int noiseMax = 200;
int counter =0;
int totalFrame = 100;
float c = 0;
float c2=1000;
//OpenSimplexNoise noise;

void setup() {
  size(600, 600);

  //noise  = new OpenSimplexNoise();
}


void draw() {
  background(255);
  stroke(0);

  render();

  c+=0.01;
  c2+=0.01;
}

void render() {
  float noiseRange = map(mouseX, 0, width, 0, 10);

  push();
  strokeWeight(5);
  beginShape();
  for (float i = 0; i <TWO_PI; i+=radians(2)) {  
    float a = map(sin(i), -1, 1, 0, noiseRange);   //noise 只有正值，所以必须映射到 正 象限
    float b = map(cos(i), -1, 1, 0, noiseRange);

    float r = map(noise( a, b, c), 0, 1, 0, noiseMax);

    float  x = width*0.5+sin(i)*r;
    float  y = width*0.5+cos(i)*r;

    vertex(x, y);
  }



  endShape(CLOSE);
  point(width*0.5+20+noise(c)*30, height*0.5-10+noise(c2)*30);
  point(width*0.5-20+noise(c)*30, height*0.5-10+noise(c2)*30);
  pop();
}

void mousePressed() {

  redraw();
}


void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popMatrix();
  popStyle();
}
