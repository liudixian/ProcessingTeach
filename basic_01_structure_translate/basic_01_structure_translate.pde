int x, y;
void setup() {
  size(600, 600);
  background(255);
  x = 0;
  y = 0;
}


void draw() {
  background(255);

  pushMatrix();
  translate(width*0.5, height*0.5);
  stroke(0);

  if (mousePressed) {
    fill(230, 100, 20);
  } else {
    fill(255);
  }

  ellipse(x, y, 100, 100);
  popMatrix();
}

void mouseDragged() {
  x = mouseX-width/2;
  y = mouseY-height/2;
}
