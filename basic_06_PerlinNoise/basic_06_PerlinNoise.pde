float t1, t2, t3 = 1;
float perlin, perlin2, perlin3 =0.0;
int x = 0;

void setup() {
  size(1080, 720);
  background(245);
}

void draw() {
  fill(255,2);
  stroke(255);
  rect(0,0,width,height);
  
  perlin = noise(t1);
  perlin2 = noise(t2);
  perlin3 = noise(t3);

  float p = map(perlin, 0, 1, 0, height-200);
  float p2 = map(perlin2, 0, 1, 0, height-200);
  float p3 = map(perlin3, 0, 1, 0, height-200);

  strokeWeight(3);
  stroke(0, 0, 255);
  point(x, p);
  stroke(255, 0, 0);
  point(x, p2+100);
  stroke(0, 255, 0);
  point(x, p3+200);

  x += 1;
  if (x >= width) {
    x =0;
  }
  t1 += 0.001;
  t2 += 0.01;
  t3 += 0.3;
}

void keyPressed() {

  if (key == 's') {
    saveFrame("screenShot-###.jpg");
    print("image saved!");
  }
}
