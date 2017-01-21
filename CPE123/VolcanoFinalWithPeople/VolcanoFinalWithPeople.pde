Building[] b = new Building[15];
People[] peoples = new People[30];
class Building {
  float startX, size, h;
  Block[] blocks;
  Building(float startX, float size, int h, int blockSize) {
    this.startX = startX;
    this.size = size;
    this.h = h;
    int numCols = (int)size/blockSize;
    int numRows = h/blockSize;
    int up = 600;
    int numWindows = (int)random(1, 3);
    ArrayList<PVector> windows = new ArrayList<PVector>();
    for (int i  = 0; i < numWindows; i++) {
      windows.add(new PVector((int)random(numCols-1), (int)random(numRows-1)));
    }
    blocks = new Block[(numCols)*(numRows)];
    for (int y = 0; y < numRows; y++) {
      up -= blockSize;
      for (int x = 0; x < numCols; x++) {
        int loc = numCols*y +x;
        color blockC = color(175, 115, 75);
        for (int i = 0; i < numWindows; i++) {
          if ((windows.get(i).x == x || windows.get(i).x == x+1) && (windows.get(i).y == y || windows.get(i).y == y+1)) {
            blockC = color(255);
          }
        }
        blocks[loc] = new Block(new PVector(startX+(x*blockSize), up), blockSize, blockSize, (x*blockSize)+(y*blockSize*(5))+(y+1)*(int)random(0, 50), blockC);
      }
    }
  }

  void draw() {
    int c = 0;
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].draw();
    }
  }
}
//People making class
public class People
{
  int armAngle = -50;
  float angleChange = 1;
  float angleChange1 = 1;
  final int ANGLE_LIMIT = 80;
  int legAngle = -75;
  int legAngle1 = -25;

  float tall;
  float wide;
  color c, c1;
  float x, y;
  float trans;
  float move = 0; 
  boolean change = true;


  public People(float t, float w, float x1, float y1, float z, color c2, color c3) 
  {
    tall = t;
    wide = w;
    c = c2;
    c1 = c3;
    x = x1;
    y = y1;
    trans = z;
  }
  void drawPeople()
  {
    if (frameCount >= 3650) {
      c = color(128);
      c1 = color(128);
    }
    pushMatrix();
    translate(x + move * trans, y);
    noStroke();
    smooth();
    fill(c);
    head();
    fill(c1);
    body();
    leftArm();
    rightArm();
    leftLeg();
    rightLeg();
    if (x + move * trans >= width  || x + move * trans <= 0) {
      change = false;
    }
    if (frameCount >= 3650) {
      move = move;
      angleChange = 0;
      angleChange1 = 0;
    } else if (change) {
      move++;
    } else {
      move--;
    }

    popMatrix();
  }
  void head() {
    pushMatrix();
    ellipse(wide/2, tall/4, wide/6, tall/6);
    popMatrix();
  }

  void body() {
    pushMatrix();
    triangle(wide/2-wide/10, tall/3, wide/2+wide/10, tall/3, wide/2, tall*4/5);
    popMatrix();
  }

  void leftArm() {
    pushMatrix();
    translate(wide/2-wide/12, tall/2.5);
    rotate(radians(armAngle));
    triangle(0, 0, 0-wide/4, 0-tall/12, 0-wide/4, 0-tall/20);
    popMatrix();
  }

  void rightArm() {
    pushMatrix();
    translate(wide/2+wide/12, tall/2.5);
    rotate(radians(-armAngle));
    triangle(0, 0, 0+wide/4, 0-tall/12, 0+wide/4, 0-tall/20);
    popMatrix();
  }

  void rightLeg() {
    pushMatrix();
    translate(wide/2+wide/45, tall*3.5/5);
    rotate(radians(legAngle1));
    triangle(0, 0, wide/18, tall/5, wide/10, tall/5);
    popMatrix();
  }

  void leftLeg() {
    pushMatrix();
    translate(wide/2-wide/45, tall*3.5/5);
    rotate(radians(legAngle));
    triangle(0, 0, 0-wide/18, tall/5, 0-wide/10, tall/5);
    popMatrix();
  }
  void updateP()
  {
    armAngle += angleChange;
    if (armAngle > ANGLE_LIMIT || armAngle < -50)
    {
      angleChange = -angleChange;
      armAngle += angleChange;
    }
    legAngle += angleChange;
    if (legAngle > ANGLE_LIMIT || legAngle <= -75)
    {
      angleChange = -angleChange;
      legAngle += angleChange;
    }
    legAngle1 += angleChange1;
    if (legAngle1 > ANGLE_LIMIT || legAngle1 <= -75)
    {
      angleChange1 = -angleChange1;
      legAngle1 += angleChange1;
    }
  }
}
//function for calling the people
void citizens() { 
  for (int i = 0; i < 30; i ++) {
    peoples[i] = new People(50, 50, 50+i*50, 554, random(-1, 1), color(234, 198, 157), color(random(255), random(255), random(255)));
  } 
  for (int i = 0; i < 30; i++) {
    peoples[i].drawPeople();
    peoples[i].updateP();
  }
}
class Block {
  PVector vel = new PVector(0, 1);
  PVector loc, expectedLoc;
  int sizeX, sizeY;
  color c;
  public Block(PVector loc, int sizeX, int sizeY, int offset, color c) {
    this.loc = new PVector(loc.x, 0-offset);
    expectedLoc = loc;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.c = c;
  }
  void draw() {
    if (loc.y < expectedLoc.y) {
      loc.y += vel.y;
    }
    fill(c);
    rect(loc.x, loc.y, sizeX, sizeY);
  }
}
float Erup;
class Particle 
{
  PVector loc;
  PVector vel;
  PVector accel;
  float r, r2;
  float life, life2, life3;
  color pcolor;

  // constructor
  Particle(PVector start) 
  {
    accel = new PVector(0, 0.03); //gravity
    vel = new PVector(random(-2, 2), random(-0.5, 0), 0);
    pcolor = color(255, 255, 153);
    loc = start.get();  // make a COPY of the start location vector
    r = 28.0;
    r2=28.0;
    life = 150;
  }

  Particle(PVector start, color c)
  {
    accel = new PVector(0, 0.02); //gravity
    vel = new PVector(random(-2.5, 2.5), random(-2, -.8), 0);
    pcolor = c;
    loc = start.get();  // make a COPY of the start location vector
    r = random(36, 49);
    r2 = random(48.0, 62);
    life = 705;
    life2 = 115;
    life3 = 90;
  }
  // TODO_1 define another constructor that allows a particle to start with a given color

  // what to do each frame
  void run() 
  {
    if (life<30) {
      r2 +=.5;
    }
    updateP();
    renderP(); // render is a fancy word for draw.  :)
  }

  // a function to update the particle each frame
  void updateP() 
  {
    vel.add(accel); 
    loc.add(vel);
    life -= 1.0;
  }

  // how to draw a particle
  void renderP() 
  {
    pushMatrix();
    stroke(pcolor);
    fill(pcolor, 70);
    translate(loc.x, loc.y);
    rotate(vel.heading());
    ellipse(0, 0, r2, r); 
    popMatrix();
  }

  // a function to test if a particle is alive
  boolean alive() 
  {
    if (life <= 0.0) 
    {
      return false;
    } else 
    {
      return true;
    }
  }
} //end of particle object definition

class PSys
{

  ArrayList particles; // all the particles
  PVector source; // where all the particles emit from
  color shade; // their main color

  // constructor
  PSys(int num, PVector init_loc) 
  {
    particles = new ArrayList();
    source = init_loc.get();  // you have to do this to set a vector equal to another vector
    shade = color(#7A0000);  // TODO_2 use this!
    for (int i=0; i < num; i++) 
    {
      particles.add(new Particle(source, shade+i/2));
    }
  }

  // what to do each frame
  void run() 
  {
    // go through backwards for deletes
    for (int i=particles.size ()-1; i >=0; i--) 
    {
      Particle p = (Particle)particles.get(i);

      // update each particle per frame
      p.run();
      if (!p.alive()) // what is that '!' thingy??
      {
        particles.remove(i);
      }
    }
  }

  // Is particle system still populated?
  // Maybe use this method to determine when
  // a system is dead and then start a new one. HINT HINT
  boolean dead() 
  {
    if (particles.isEmpty()) 
    {
      return true;
    } else 
    {
      return false;
    }
  }
}

PSys fireW1, fireW2, fireW3, fireW4;




void setup() {
  size(1160, 660);
  citizens();
  noStroke();
  frameRate(120);
  colorMode(RGB, 255, 255, 255, 100);
  fireW1 = new PSys(100, new PVector(width/2, height/1.4));
  float xMod = 0;
  float lastX = 0;
  int hMod =0;
  for (int i = 0; i < b.length; i++) {
    xMod = random(40, 90);
    hMod = (int)random(0, 50);
    b[i] = new Building((i*90), xMod, 25+hMod, 5);
    lastX = xMod;
  }
}

void drawBasePage() {
  //draw background
  pushMatrix();
  translate((width-460)/2, 0);
  background(#1A3366);
  fill(255);
  ellipse(330, 200, 50, 50);
  fill(#152952);
  ellipse(320, 200, 40, 50);

  fill(255);
  ellipse(50, 130, 10, 10);
  ellipse(310, 230, 7, 7);
  ellipse(370, 300, 9, 9);
  ellipse(380, 80, 4, 4);
  ellipse(200, 80, 4, 4);
  ellipse(25, 80, 5, 5);


  pushMatrix();
  scale(.75, .75);
  translate(120, 410);


  pushMatrix();
  translate(200, 200);
  scale(Erup);
  translate(-200, -200);
  noStroke();
  fill(#7A0000);
  int mid = 230;
  ellipse(200, 140, 120, 120);
  ellipse(240, 100, 120, 120);
  ellipse(160, 100, 120, 120);
  ellipse(200, 70, 120, 120);
  ellipse(200, 10, 220, 120);
  ellipse(110, 60, 120, 120);
  ellipse(290, 60, 120, 120);
  ellipse(290, -10, 220, 220);
  ellipse(200, -10, 220, 220);
  ellipse(180, -25, 220, 220);


  //lava
  fill(#FF0000);
  triangle(150, 220, 155, 50, 190, 220);
  triangle(170, 220, 195, 50, 220, 220);
  triangle(190, 220, 235, 50, 240, 220);
  fill(#FF3300);
  triangle(150, 220, 130, 40, 200, 220);
  triangle(180, 220, 160, 40, 230, 220);
  triangle(180, 220, 220, 40, 240, 220);
  triangle(210, 220, 260, 40, 250, 220);
  //yellow lava
  fill(#E6E600);
  ellipse(100, 40, 15, 15);

  arc(120, 75, 15, 60, PI/.8, 4+PI);
  arc(160, 65, 10, 60, PI/.8, 4+PI);
  arc(230, 84, 7, 60, PI/.8, 4+PI);


  triangle(180, 220, 150, 90, 230, 220);
  triangle(180, 220, 220, 90, 230, 220);
  triangle(180, 220, 260, 90, 230, 220);

  popMatrix();


  //volcanoe
  //460
  fill(#331A00);
  quad(140, 200, 260, 200, 380, 380, 20, 380);
  noStroke();
  quad(0, 380, 0, 400, 400, 400, 400, 380);


  //lava stream
  fill(#CCCC00);
  rotate(PI/4);
  translate(45, -178);
  ellipse(225, 220, 20, 60);
  rotate(-PI/6);
  ellipse(145, 290, 20, 50);
  ellipse(76, 340, 20, 50);
  rotate(PI/4);
  ellipse(310, 210, 10, 35);
  rotate(-PI/2);
  ellipse(-115, 340, 20, 50);

  popMatrix();

  //draw grass
  //  fill(120, 142, 80);
  //  rect(-(width-460)/2, 600, width, 60);
  popMatrix();
}
void draw() {
  pushMatrix();
  if (frameCount>=3530 && frameCount<3580) {
    translate(random(10), random(10));
    Erup+=.02;
  }
  drawBasePage();

  if (frameCount <= 800) {
    for (int i = b.length/2 - 2; i < b.length/2 +2; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 800 && frameCount <= 1500) {
    for (int i = b.length/2 - 4; i < b.length/2 +4; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 1500) {
    for (int i = 0; i < b.length; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 3530) {
    fireW1.run();  
    if (fireW1.dead()) {
      translate(random(10), random(10));
      fireW1 = new PSys(100, new PVector(width/2, height/1.5));
    }
  }
  fill(120, 142, 80);
  noStroke();
  rect(-(width-460)/2, 600, width*2, 60);
  if (frameCount >= 700) {
    for (int i = 0; i < 5; i++) {
      peoples[i].drawPeople();
      peoples[i].updateP();
    }
    if (frameCount >= 1300) {
      for (int i = 5; i < 10; i++) {
        peoples[i].drawPeople();
        peoples[i].updateP();
      }
      if (frameCount >= 1900) {
        for (int i = 10; i < 15; i++) {
          peoples[i].drawPeople();
          peoples[i].updateP();
        }
        if (frameCount >= 2500) {
          for (int i = 15; i < 20; i++) {
            peoples[i].drawPeople();
            peoples[i].updateP();
          }
          if (frameCount >= 3200) {
            for (int i = 20; i < 30; i++) {
              peoples[i].drawPeople();
              peoples[i].updateP();
            }
          }
        }
      }
    }
  }
  popMatrix();
}

