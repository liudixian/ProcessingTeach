//两种渲染模式
float x, y;

void setup() {
  size(640, 480, P2D);
  //size(640, 480);
  surface.setResizable(true);
  x = random(width);
  y = random(height);
pixelDensity(2);

}

void draw() {
  background(255);
  surface.setTitle("frameRate "+frameRate);

  for (int i =0; i <5000; i ++) {
    fill(random(255),random(255),200,120);
    stroke(random(255));
    x = random(width);
    y = random(height);
    ellipse(x, y, random(10), random(12));
  }
}
