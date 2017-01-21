PImage img;
void setup() {
  size(400,400);
  background(255);
  img = loadImage("blexbolexBreath.jpg");
  img.resize(400, 100);
  image(img, 0, -10);
}
void draw() {
  noStroke();
  fill(94, 47, 31);
  rect(0, 100, 160, 300);
  fill(114, 185, 251, 95);
  rect(160, 100, 150, 300);
  fill(94, 47, 31);
  rect(300, 100, 100, 300);
  
}
  
