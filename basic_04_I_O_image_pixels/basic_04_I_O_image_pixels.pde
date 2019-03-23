/*
  内置滤镜参数：THRESHOLD-阈值, GRAY, OPAQUE, INVERT, 
 POSTERIZE, BLUR, ERODE,  DILATE
 */
PImage img, img1, img2;
char keyWord = ' ';
PFont Arial, Song, H, Dialog;
String reference = "MODE:\n1: THRESHOLD\n2: GRAY\n3: OPAQUE\n4: INVERT\n5: POSTERIZE\n6: BLUR\n7: ERODE\n8: Tini";
int ipd; 
color c;

void setup() {
  size(520, 700, P2D);
  img = loadImage("雕像.jpg");
  img1 = loadImage("雕像-small.jpg");
  ipd = width*height;
  ;
  Arial = loadFont("Arial-Black-140.vlw");
  Song = loadFont("STSong-48.vlw");
  H = loadFont("hzgb-48.vlw");
  Dialog = loadFont("Dialog-48.vlw");

  //pixelDensity(2);
}


void draw() {
  switch (keyWord) {
  case '1':
    break;
  }

  image(img1, 0, 0, width, height);

  /*
    Getting the color of a single pixel with get(x, y) is easy,
   but not as fast as grabbing the data directly from pixels[]. 
   The equivalent statement to get(x, y) using pixels[] is pixels[y*width+x]. 
   See the reference for pixels[] for more information.
   */

  float w = map(mouseX, 0, width, 2, 50);

  img.loadPixels();
  for ( int i =0; i <width; i+=w) {
    for (int j =0; j <height; j +=w) {
      c = img1.pixels[j*width+i];   //
      //c = img.get(i, j);
      fill(c);
      noStroke();
      rect(i+random(5), j+random(10), w, w);
    }
  }

  txt();
}

void keyPressed() {
  keyWord = key;
  redraw();

  if (key == 's') {
    saveFrame("screenShot-###.jpg");
    print("image saved!");
  }
}

void txt() {
  textFont(Dialog);
  textSize(22);
  fill(9, 9, 9, 255);
  text(reference, 8, 27);
}
