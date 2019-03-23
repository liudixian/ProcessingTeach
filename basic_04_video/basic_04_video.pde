import processing.video.*;
import java.awt.Color;
import gifAnimation.*;

GifMaker gifExport;
Capture video;
int counter =0;

//细胞单元的大小
int cellSize = 10;
//列和行的 数量
int cols, rows;
float[] hsb = new float[3];
int radmVal = 7;

void setup() {
  size(640, 480, OPENGL);
  frameRate(30);

  cols = width/cellSize;
  rows = height/cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  //colorMode(HSB, 360, 100,100);

  String[] cameras = Capture.list();

  pixelDensity(2);
  if (cameras ==null) {
    print("获取摄像头列表失败...");
    video = new Capture(this, 640, 360);
  }
  if (cameras.length ==0) {
    print("您的电脑没有可用的摄像头！或者摄像头已损坏");
    exit();
  } else {
    print("可用的谁想头为：");
    printArray(cameras);
  }
  //video = new Capture(this, cameras[3]);
  video = new Capture(this, width, height);

  video.start();

  //GIF
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(0, 0, 0); // make blac
  gifExport.setQuality(12);
  background(0);

  counter =0;
}

void draw() {
  key ='1';
  switch (key) {
  case '1':
    saveFrame("output/fr"+nf(counter, 3)+".png");
    //gifExport.setDelay(34);
    //gifExport.addFrame();
    break;
  case '2': 
    break;
  }

  background(255);

  if (video.available()) {
    video.read();

    //image(video, 0, 0, width, height);   //显示摄像头图像

    video.loadPixels();

    for (int i  = 0; i < cols; i ++) {
      for (int j = 0; j <rows; j ++) {
        int x = i*cellSize;
        int y = j*cellSize;
        // pixel[i]  = y * width + x
        int loc = (video.width - x -1) + y* video.width;  //将像素的坐标反向 形成镜子的效果

        color currenC = video.pixels[loc];

        int r = (currenC >> 16) & 0xff;
        int g = (currenC >> 8) & 0xff;
        int b = currenC & 0xff;
        //color c = color(r, g, b, 20);

        float H = hue(currenC);
        float S = saturation(currenC);
        float B = brightness(currenC);

        float N = map(mouseX, 0, width, 0, 255);
        float Q = map(mouseY, 0, height, 0, 255);
        float interval = map(mouseX, 0, width, 0, 10);
        float w = map(B, 0, 100, 10, 0);

        //color c = color(H+N, S, B+Q);
        color c = color(r, g-N, b-Q);

        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        //rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        //noFill();
        noStroke();
        //stroke(c);
        // Rects are larger than the cell for some overlap
        //rect(random(-radmVal,radmVal), random(-radmVal,radmVal), cellSize+6, cellSize+6);
        //rect(0, 0, cellSize-interval, cellSize-interval);
        rect(0, 0, w, w);
        //ellipse(random(-5,5), random(-5,5), cellSize+15, cellSize+15);
        popMatrix();
      }
    }
  }


  surface.setTitle("frameRate "+frameRate);

  counter++;
}

void keyPressed() {
  if (key =='2') {
    //saveFrame("RGB_Video_cap-###.png");
    //println("Image Saved!");
    gifExport.finish();
    println("gif saved");
  }
}
