
// Pallet parameters

int canvasXSize = 9411;
int canvasYSize = 9411;

int maxpal = 512;
int numpal = 0;
int maxPoints = 100;
int margin = 30;

int squareSize = 400;


float startX, startY, endX, endY;

color[] goodcolor = new color[maxpal];
int size = 15;
int count;
int c = 0;
boolean firstTime = true;


void setup() {
  size(9411, 9411);
  background(0);
  noLoop();
  pickColourFromPallet("pallet.png");
}

void draw() {
if(firstTime){
 background (0); 
}

  for (float i = 0; i <= canvasXSize / squareSize; i = i + 1) {

    for (float j = 0; j <= canvasYSize / squareSize; j = j + 1) {

      thing(i * squareSize, j*squareSize, squareSize);
    }
  }
  
  save("fabric.png");
  exit();
}

void thing(float xOffset, float yOffset, float size) {
  count=0;
  // background(0);

  for (int i = 0; i < maxPoints; i++) {

    c = int(random(512));

    fill(goodcolor[c]);
    startX = random(margin, size - margin) ;
    startY = random(margin, size - margin);

    startX = startX + xOffset;
    startY = startY + yOffset;

    endX = endX + xOffset;
    endY = endY + yOffset;

    strokeWeight(1);
    stroke(0);
    ellipse(startX, startY, 30, 30); 


    startX = random(margin, size - margin);
    endX = random(margin, size - margin);

    startY = random(margin, size - margin);
    endY = random(margin, size - margin);

    startX = startX + xOffset;
    startY = startY + yOffset;

    endX = endX + xOffset;
    endY = endY + yOffset;


    stroke(goodcolor[c]);
    strokeWeight(random(10));
    line(startX, startY, endX, endY); 
    fill(0);
    ellipse(startX, startY, 10, 10);
  }
}


void pickColourFromPallet(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);

  for (int x=0; x<b.width; x++) {
    for (int y=0; y<b.height; y++) {
      color c = get(x, y);
      boolean exists = false;
      for (int n=0; n<numpal; n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}


void mouseClicked() {
  background(0);
  // thing(100, 100, 500);
}
