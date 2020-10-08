// Hasta las estrellas
// 2020, Colormono
// para Display Lcd 128x64 Grafico Spi St7920 Glcd

int lcdWidth = 128;
int lcdHeight = 64;
int partyMin = 1;
int partyMax = 5;
int padding = 3;
int floorH = 54;

void setup() {
  size(148, 84);
  ellipseMode(CENTER);
  pixelDensity(2);

  generate();
}

void draw() {
}

void generate() {
  // select party
  int party = floor(random(partyMin)*partyMax)+1;
  println("Party of", party);

  // pick members
  int[] partyMembers = new int[party];
  int[] partySeats = new int[party];
  int partyWidth = -padding;

  for (int i=0; i<party; i++) {
    // child or grown
    int memberSize;
    if (random(1) > 0.5) {
      // child
      memberSize = floor(random(9, 14));
    } else {
      // grown
      memberSize = floor(random(19, 22));
    }
    partyMembers[i] = memberSize;
    partySeats[i] = partyWidth + padding;
    partyWidth += memberSize + padding;
    print("Reserved a seat of", memberSize);
    println(" in pixel", partyWidth);
  }
  println("Total width", partyWidth);

  // row position
  int rowX = floor((lcdWidth - partyWidth) / 2);
  println("Row should start at x", rowX);

  // lcd screen simulation
  pushMatrix();
  translate(10, 10);
  background(0);
  noStroke();
  fill(0, 0, 255);
  rect(0, 0, lcdWidth, lcdHeight);
  fill(255, 255, 255, 190);

  // draw party
  for (int i=0; i<party; i++) {
    int x = rowX + partySeats[i];
    int y = floorH - partyMembers[i];
    int d = partyMembers[i];

    int gen = floor(random(1)*3+1);
    switch(gen) {
    case 1:
      genTriangle(x, y, d, d);
      break;
    case 2:
      genBox(x, y, d, d);
      break;
    default:
      genCircle(x, y, d);
    }
  }

  // draw stars
  drawStars();

  // draw floor
  // with random grass (pixels)
  drawGrass();

  // drawRules();
  popMatrix();
}

void mousePressed() {
  saveFrame(frameCount + floor(random(100)) + ".jpg");
  generate();
}

void genCircle(int x, int y, int d) {
  //u8g.drawDisc(x, y, d);
  ellipse(floor(x+d/2), floor(y+d/2), d, d);
}

void genBox(int x, int y, int w, int h) {
  //u8g.drawBox(x, y, w, h);
  rect(x, y, w, h);
}

void genTriangle(int x, int y, int w, int h) {
  //u8g.drawTriangle(14,9, 45,32, 9,42);
  triangle(x, y+h, floor(x+w/2), y, x+w, y+h);
}

void drawGrass() {
  //u8g.setColorIndex(1);
  //u8g.drawBox(10, 12, 20, 30);  
  rect(0, floorH+1, lcdWidth, lcdHeight-floorH-1);
  fill(0, 0, 255);
  //u8g.setColorIndex(0);
  for (int g=0; g<lcdWidth; g++) {
    // clear pixel at (28, 14)
    //u8g.drawPixel(28, 14);          
    if (random(1) > 0.5) {
      rect(g, floorH+1, 1, 1);
    }
    if (random(1) > 0.5) {
      rect(g, floorH+3, 1, 1);
    }
  }
}

void drawStars() {
  //u8g.setColorIndex(1);
  //u8g.drawBox(10, 12, 20, 30);  
  //u8g.setColorIndex(0);
  int starsBottom = 30;
  int starsGrid = 5;
  for (int x=0; x<lcdWidth; x+=starsGrid) {
    for (int y=0; y<starsBottom; y+=starsGrid) {
      // clear pixel at (28, 14)
      //u8g.drawPixel(28, 14);
      int size = floor(map(y, 0, starsBottom, 4, 1));
      if (random(1) > 0.85) {
        rect(x, y, size, size);
      }
    }
  }
}
void drawRules() {
  stroke(255);
  line(lcdWidth*0.5, 0, lcdWidth*0.5, lcdHeight);
  line(0, lcdHeight*0.5, lcdWidth, lcdHeight*0.5);
}
