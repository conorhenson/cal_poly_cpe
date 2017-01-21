//a variable to control location
int tx = 0;

//method to set up the sketch size
void setup() {
  size(400, 400);
  smooth();
}

//method to draw my background
void drawSet(int offsetX, int offsetY) {
  fill(26, 29, 137);
  rect(offsetX, offsetY, 100, 200);
  fill(72, 75, 198);
  rect(offsetX+100, offsetY+50, 100, 150);
}

//method to draw my character
void drawChar(int tx, int ty) {
  pushMatrix();
  translate(tx, ty);
  fill(33, 137, 26);
  ellipse(0, 0, 40, 40);
  fill(110, 26, 137);
  ellipse(-5, -5, 5, 5);
  ellipse(5, -5, 5, 5);
  popMatrix();
}

//method to draw  all elements of my sketch
void draw() {
  background(254);
  drawSet(100, 100);
  drawChar(tx, 270);
  tx = tx + 1;
}