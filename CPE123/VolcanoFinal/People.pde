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