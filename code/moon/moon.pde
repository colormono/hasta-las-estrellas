import processing.svg.*;

void setup() {
  size(400, 400);
  background(255, 255, 255);
}

void draw() {  
  background(255);
  beginRecord(SVG, "moon"+random(1000)+".svg");
  stroke(0);
  noLoop();

  float step=(2*PI)/180;
  int posX = width/2;
  int posY = height/2;
  float radius = 100;
  int xOld=0, yOld=0;

  for (float theta=0; theta<=(2*PI)+step; theta+=step) {
    int a = int(radius*sin(theta) + posX);
    int b = int(radius*sin(theta+PI) + posX);
    int y = int(radius*cos(theta) + posY);
    if (theta>0) {
      pushMatrix();
      translate(random(-10, 10), 0);
      line(a, y, b, y);
      popMatrix();
    }

    xOld = a;
    yOld = y;
  }
  
  endRecord();
}
