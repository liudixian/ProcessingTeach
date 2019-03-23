/*
  内置滤镜参数：THRESHOLD-阈值, GRAY, OPAQUE, INVERT, 
 POSTERIZE, BLUR, ERODE,  DILATE
 */
PImage img, img1, img2;
char keyWord = ' ';
PFont Arial, Song, H, Dialog;
String reference = "MODE:\n1: THRESHOLD\n2: GRAY\n3: OPAQUE\n4: INVERT\n5: POSTERIZE\n6: BLUR\n7: ERODE\n8: Tini";
void setup() {
  size(520, 700, P2D);
  img = loadImage("雕像.jpg");

  img1 = loadImage("雕像.jpg");
  img2 = loadImage("雕像.jpg");

  Arial = loadFont("Arial-Black-140.vlw");
  Song = loadFont("STSong-48.vlw");
  H = loadFont("hzgb-48.vlw");
  Dialog = loadFont("Dialog-48.vlw");

  pixelDensity(2);
}


void draw() {
  switch (keyWord) {
  case '1':
    //调整阈值
    img1.filter(THRESHOLD, 0.3);
    img2.filter(THRESHOLD, 0.7);
    break;
  case '2':
    //灰色
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(GRAY);
    break;
  case '3':
    //OPAQUE 不透明
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(OPAQUE);
    break;
  case '4':
    //反色
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(INVERT);
    break;
  case '5':
    //色调分离
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(POSTERIZE, 4);
    break;
  case '6':
    //色调分离
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(BLUR, 7);
    break;
  case '7':
    //腐蚀
    img1 = loadImage("雕像.jpg");
    img2 = loadImage("雕像.jpg");
    img2.filter(ERODE);
    break;
  }


  //img.resize(width, height);
  //image(img, 0, 0, img.width, img.height);
  noTint();
  image(img1, 0, 0, width, height);
  switch (keyWord) {
  case '8':
    tint(color(252, 219, 181,250));
    image(img2, width/2, 0, width, height);
    break;
  default:
    image(img2, width/2, 0, width, height);
  }


  txt();
}

void keyPressed() {
  keyWord = key;
  redraw();
}

void txt() {
  textFont(Dialog);
  textSize(22);
  fill(9,9,9,255);
  text(reference, 8, 27);
}
