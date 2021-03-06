int stepX, stepY;
int segmentCount = 20;
PGraphics pg;

void setup() {
  size(600, 600, P2D);
  pixelDensity(2);

  pg = createGraphics(width, height);
}

void draw() {
  colorGrid();
  //colorCircle(300);
}

//光谱网格
void colorGrid() {
  colorMode(HSB, width, height, 100);  
  stepX = mouseX +5;   //可以不用加5，仅仅为了交互体验
  stepY = mouseY+5;
  for (int gridY =0; gridY < height; gridY += stepY ) {
    for (int gridX=0; gridX <width; gridX += stepX) {
      fill(gridX, height-gridY, 100);
      stroke(gridX, height-gridY, 100);
      rect(gridX, gridY, stepX, stepY);
    }
  }
}

void colorCircle(int r_) {
  int r = r_;
  float angleStep = 360/segmentCount;
  pg.beginDraw();
  pg.colorMode(HSB, width, height, 100);  
  pg.background(0,0,100);
  pg.beginShape(TRIANGLE_FAN);
  pg.vertex(width*0.5, height*0.5);
  for (int angle=0; angle <= 360; angle += angleStep) {
    float vx = width/2 + cos(radians(angle)) * r;
    float vy = height/2 + sin(radians(angle)) * r;
    pg.vertex(vx, vy);
    pg.fill(angle, mouseY, mouseY);
    pg.stroke(angle, mouseY, mouseY);
  }
  endShape();
  pg.endDraw();

  image(pg, 0, 0);
}

void keyPressed() {
  switch(key) {
  case '1':
    segmentCount = 360;
    break;
  case '2':
    segmentCount = 45;
    break;
  case '3':
    segmentCount = 24;
    break;
  case '4':
    segmentCount = 12;
    break;
  }

  if (key == 's') {
    saveFrame(millis()+"_image.jpg");
    print("image saved!");
  }
}
