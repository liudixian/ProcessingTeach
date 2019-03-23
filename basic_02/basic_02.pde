int x =0;
char pressedKey = ' ';

void setup() {
  size(600, 600, P2D);
  //ellipse(300,300,280,280);
  frameRate(60); //绘制的速度
  pixelDensity(2);
  background(255);
}

void draw() {
  //x = x+1;
  switch(pressedKey) {
  case '1':
    //用加法来制造动画
    stroke(0, floor(map(x, 0, width, 0, 50)));
    strokeWeight(1);
    fill(0, 0, 0, floor(map(x, 0, width, 0, 30)));
    x += 5;

    if (x >= width) {
      x = 0;
    }
    ellipse(x, 300, 130, 130);
    break;
  case '2':
    drawCircle();
    break;
  case '3':
    //动画是逐层绘制的，用过"层"来制造更多效果
    //效果一
    background(255);
    fill(250, 197, 95);
    strokeWeight(11);
    stroke(241, 147, 0);
    ellipse(mouseX, mouseY, 130, 130);
    break;
  case '4':
    //效果二 "影子"
    color c = color(255);
    stroke(c, 20);
    fill(c, 20);
    rect(0, 0, width, height);
    fill(250, 197, 95);
    strokeWeight(11);
    stroke(241, 147, 0);
    ellipse(mouseX, mouseY, 130, 130);
    break;
  case '5':
    //效果三 "画笔"
    for (int i =0; i <100; i +=1) {
      fill(random(255), random(255), random(255), 200);
      stroke(random(255), random(255), random(255), random(255));
      fill(0, 80);
      stroke(0, 80);
      noStroke();
      ellipse(random(mouseX-30, mouseX+30), random(mouseY-30, mouseY+30), 2, 2);
    }
    break;
  case '6':
    //效果四 画笔二
    strokeWeight(3);
    noFill();
    stroke(0, 10);
    ellipse(mouseX+20, mouseY+20, 80, 80);
    break;
  case '7':
     drawCoircle(200);
    break;

  case '8':
    background(200);
    beginShape();
    vertex(20, 20);
    vertex(40, 20);
    vertex(40, 40);
    vertex(60, 40);
    vertex(60, 60);
    vertex(20, 60);
    endShape(CLOSE);
    break;
  }
}


void keyPressed() {
  pressedKey = key;

  if (key == 'r') {
    background(255);
  }

  if (key == 's') {
    saveFrame(millis()+"_image.jpg");
    print("image saved!");
  }
}
//rect();  ellipse();
void drawCircle() {
  //用鼠标来制造动画
  stroke(0);
  strokeWeight(1);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 30, 30);
}


int qiuHe(int a, int b){
  int c = a +b;
  
  return c;
}


void drawCoircle(int c){
   //自定义形状
    background(c);

    fill(234, 234, 234);
    beginShape();
    vertex(423, 108);
    vertex(488, 406);
    vertex(216, 478);
    vertex(67, 296);
    vertex(229, 71);
    vertex(266, 314);
    endShape(CLOSE);
}
