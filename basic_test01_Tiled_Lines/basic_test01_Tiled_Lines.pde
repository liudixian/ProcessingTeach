int step;
int density= 20;
boolean simpleLine = true;
boolean pixelLine = false;
int y =0;

void setup() {
  size(600, 600);
  step = width/density;
  smooth();
  pixelDensity(2);
}

void draw() {
  background(0, 150, 255);
  for (int i =0; i < width; i +=step) {
    for (int j =0; j <height; j+=step) {
      //strokeWeight(4);
      stroke(255);
      fill(255);

      if (simpleLine) {
        density = floor(map(mouseX, 0, width, 0, 20));
        dshape(i, j, step, step, density);
      }
      if (pixelLine) {
        int d = floor(map(mouseX, 0, width, 2, 15));
        if (random(1)>=0.5) {
          pixel(i, j, step, step, d, d, "left");
        } else {
          pixel(i, j, step, step, d, d, "right");
        }
      }
    }
  }
  stroke(255);
  noLoop();

  updatePixels();
}

void dLines(int x, int y, int w, int h, int s) {
  boolean leftToRight = random(1) >=0.5;
  if (leftToRight) {
    //line(x, y, x+w, y+h);
    //dshape(x, y, w, h, s);
  } else {
    line(x+w, y, x, y+h);
    //dshape(x, y, w, h, s);
  }
}

void mousePressed() {
   
  redraw();
}

//直线化one line
void dshape(int x, int y, int w, int h, int s) {
  boolean leftToRight = random(1) >=0.5;
  if (leftToRight) {
    pushMatrix();
    translate(x+w, y+h);
    beginShape();
    vertex(x+w-s, y-h);
    vertex(x+w, y-h);
    vertex(x+w, y-h+s);
    vertex(x-w+s, y+h);
    vertex(x-w, y+h);
    vertex(x-w, y+h-s);
    //vertex(x+w-s, y-h);
    endShape(CLOSE);
    popMatrix();
  } else {
    pushMatrix();
    translate(x+w, y+h);
    beginShape();
    vertex(x-w, y-h);
    vertex(x-w+s, y-h);
    vertex(x+w, y+h-s);
    vertex(x+w, y+h);
    vertex(x+w-s, y+h);
    vertex(x-w, y-h+s);
    //vertex(x+w-s, y-h);
    endShape(CLOSE);
    popMatrix();
  }
}

//像素化one line
void pixel(int x, int y, int w, int h, int s, int r, String m) {
  if (m =="left") {
    rect(x, y, w/s, h/s);
    r--;
    if (r>0) {
      x = x+w/s;
      y = y+h/s;
      pixel(x, y, w, h, s, r, m);
    }
  } else if (m == "right") {
    rect(x+w, y, w/s, h/s);
    r--;
    if (r>0) {
      x = x-w/s;
      y = y+h/s;
      pixel(x, y, w, h, s, r, m);
      println(2);
    }
  }
}

void keyPressed() {
  if (key =='1') {
    simpleLine = true;
    pixelLine = false;
  } else if (key == '2') {
    simpleLine = false;
    pixelLine = true;
  }

  if (key == 's') {
    saveFrame("screenShot-###.jpg");
    print("image saved!");
  }
}
