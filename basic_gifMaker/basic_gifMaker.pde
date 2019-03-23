float increase = 0.01;
int totalFrames = 100;
boolean record = true;
int counter =0;  
float percent = 0;

void setup() {
  size(640, 360);
}


void draw() {


  if (record) {
    percent = float(counter) / totalFrames;   //等效于 counter += 0.01
  } else {
    percent = float(counter % totalFrames) / totalFrames;   //用过取模 转换为一个在 0.01~1.00之间循环的数字
  }
  println(percent);

  render(percent);

  if (record) {
    saveFrame("output/gif-" + nf(counter, 3) + ".png");
    if (counter == totalFrames-1) {
      exit();
    }
  }

  counter ++;
}


void render(float percent) {
  background(0);

  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(percent);
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(0, 0, 200, 200);
  popMatrix();
}
