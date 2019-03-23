PImage img;

void drawIcon(int w, String dir) {
  int rectW = w/6;
  int orin= rectW;
  for (int step=0; step<3; step ++) {
    if (dir =="up") {
      rect(orin, 0, rectW, w);
      orin+=2*rectW;
    } else if (dir=="down") {
      rect(0, orin, w, rectW);
      orin+=2*rectW;
    }
  }
}

int cellSize = 12; 

void setup() {
  size(448, 640);
  background(255);

  img = loadImage("painting.jpg");
  //img = loadImage("cublism.jpg");
  img.resize(width,height);
}

void draw() {
  image(img,0,0,img.width,img.height);
  //loadPixels();
  randomSeed(2);
  loadPixels();
  
  for (int i =0; i <img.width; i +=cellSize ) {
    for (int j =0; j <img.height; j +=cellSize ) {
      color c = img.pixels[i+j*img.width];

      pushMatrix();
      translate(i, j);
      fill(c);
      noStroke();
      String[] dirs = {"up", "down"};
      drawIcon(cellSize, dirs[(int)random(2)]);
      popMatrix();
    }
  }
}
