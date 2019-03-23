int x = 0;    //创建变量 并赋值；  类型—-整数类型
int y = 600;
int red = 255;   //0~255  RGB;
int green = 255;
int blue = 255;


void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  //println(int(random(255)));
  red = int(random(255));
  green = int(random(255));
  blue = int(random(255));

  stroke(red, green, blue);
  line(x, 0, x, height);  //width, height

  x = x+1;
  println(x);
}
