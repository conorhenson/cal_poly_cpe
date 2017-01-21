PImage img, hand;
float x = 0.0;
float y = 0.0;
int deltaX = 0;

void setup() {
  size(400,400);
  background(255);
  //BREATH
  img = loadImage("blexbolexBreath.jpg");
  img.resize(400, 100);
  image(img, 0, -10);
  ellipseMode(CENTER);
}
void draw() {
  //Other blexbolex behind window
  guy(deltaX);
  sign();
  deltaX += 1;
  if (deltaX == 320){
    deltaX = 0;
  }
  
  //Big brown wall
  noStroke();
  fill(94, 47, 31);
  rect(0, 100, 160, 300);
  
  //Small brown wall
  fill(75, 32, 26);
  rect(310, 100, 100, 300);
  
  //Blue Glass
  fill(114, 185, 255, 99);
  rect(160, 100, 150, 300);
  
  //Face
  fill(255);
  ellipse(170, 250, 60, 75);
  triangle(199, 260, 202, 263, 195, 264);
  fill(253, 52, 26);
  quad(195, 245, 199, 241, 199, 244, 197, 247);
  fill(255);
  quad(140, 280, 170, 280, 160, 300, 145, 300);
  
  //Hand
  hand = loadImage("blexbolexland1.png");
  hand.resize(60, 60);
  image(hand, 210, 282);
  
  //Shirt
  fill(81, 87, 146);
  beginShape();
  vertex(110, 400);
  bezierVertex(110, 350, 125, 290, 140, 280);
  bezierVertex(190, 305, 205, 320, 205, 345);
  vertex(210, 347);
  vertex(230, 320);
  vertex(250, 327);
  vertex(215, 377);
  bezierVertex(200, 380, 195, 370, 180, 360);
  vertex(180, 400);
  endShape();
  
  //Hair
  fill(253, 52, 26);
  stroke(0);
  beginShape();
    vertex(160, 200);
    bezierVertex(180, 205, 180, 210, 180, 210);
    bezierVertex(215, 215, 200, 235, 198, 235);
    bezierVertex(170, 240, 180, 250, 180, 260);
    bezierVertex(170, 270, 180, 280, 180, 280);
    bezierVertex(180, 285, 175, 295, 160, 285);
    bezierVertex(150, 295, 140, 275, 130, 285);
    bezierVertex(105, 275, 125, 265, 115, 260);
    bezierVertex(110, 250, 105, 240, 130, 235);
    bezierVertex(125, 210, 145, 205, 160, 200);
   endShape();
    
 //"Breath"
y += .005;
x = cos(y);
 
 
 translate(217, 265);
 scale(x);
 fill(255, 255, 255, 99);
 noStroke();
 ellipse(0, 0, 25, 60);
 
}

void sign() {
  
 
  pushMatrix();
  translate(287.5,170);
  stroke(0);
  
  fill(144,181,200);
  rect(-5,30,10,180);
  noStroke();
  fill(209,68,0);
  ellipse(0,0,60,60);
  fill(251,247,210);
  rect(-17.5,-5,40,10);
  popMatrix();
}

void guy(int deltaX) {
  pushMatrix();
  smooth();
  translate(deltaX, 0);
  stroke(111,68,0);
  fill(111,68,0);
  ellipse(130,250,60,120);
  ellipse(130,220,60,60);
  fill(121,130,7);
  noStroke();
  rect(120,185,20,100);
  fill(111,68,0);
  fill(213,89,78);
  ellipse(130,175,27,30);
  ellipse(122,179,20,10);
  fill(118,75,1);
  arc(130,175,27,30,-5*PI/7,PI/4);
  stroke(111,68,0);
  ellipse(210,360,10,40);
  fill(111,68,0);
  quad(192.5,335,205,355,210,378,192.5,365);
  noStroke();
  fill(111,68,0);
  quad(140,325,192,366,192.5,336,140,280);
  quad(140,325,120,365,110,310,140,280);
  quad(120,310,100,320,89,295,120,280);
  quad(120,365,115,340,90,340,90,350);
  ellipse(90,355,10,30);
  ellipse(95,368,15,5);
  popMatrix();
}
