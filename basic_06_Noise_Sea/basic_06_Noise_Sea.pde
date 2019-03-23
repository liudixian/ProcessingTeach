float xoff=0;    //浮点数 float
float yoff = 0;


void setup(){
  
  
size(1000,600);
//frame.ReSizable(true);
}



void draw() {
  
  frameRate(2);
  noStroke();
  fill(216,81,78,80);
ellipse(width/2,height*.518,40,40);     //太阳

//渐变
  fill(217,217,277,30);
  rect(0,0,width,height);
  
  
beginShape();      
fill(38,138,178,35);
noStroke();

for(int i=0; i <width; i ++){
  
  vertex(i,noise(xoff,yoff)*180+300);
  xoff +=0.002;
}
vertex(width,height);
vertex(0,height);
endShape(CLOSE);

//2
beginShape();
fill(38,138,178,27);
noStroke();
for(int i=width; i >0; i --){
  
  vertex(i,noise(xoff,yoff)*150+400);
  xoff +=0.002;
}
vertex(0,height);
vertex(width,height);
endShape(CLOSE);


//3
beginShape();
fill(38,138,178,25);
noStroke();
for(int i=width; i >0; i --){
  
  vertex(i,noise(xoff,yoff)*100+550);
  xoff +=0.002;
}
vertex(0,height);
vertex(width,height);
endShape(CLOSE);


yoff+=0.01;

}

void keyPressed() {

  if (key == 's') {
    saveFrame("screenShot-###.jpg");
    print("image saved!");
  }
}
