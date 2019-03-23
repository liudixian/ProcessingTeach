OpenSimplexNoise noise;
float zoff =0;
int numFrame = 30;

void setup() {
  size(640, 360, P2D);
  //pixelDensity(1);
  noise = new OpenSimplexNoise();
  smooth();
}

void draw() {
  loadPixels();
  background(0);
  float xoff=0;
  float detail = map(mouseX, 0, width, 0.04, 0.001);
  noiseDetail(8, detail);
  for (int i=0; i <width; i++) {
    xoff += 0.01;
    float yoff = 0;

    for (int j=0; j<height; j++) {
      noStroke();
      float alpha = (float)noise.eval(zoff, xoff, yoff)*255;
      float bright = map(alpha, 0, 1, 0, 255);

      pixels[i+j*width] = color(bright,10,20);

      yoff +=0.01;
    }
  }
  updatePixels();

  zoff +=0.02;

  //if (frameCount <= numFrame) {
  //  saveFrame("./peilin-gif/fs###.gif");
  //  println(frameCount);
  //}else if(frameCount >numFrame){
  //  println("GIF-Saved!");
  //}
}
