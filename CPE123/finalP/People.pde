class People
{
  //import gifAnimation.*;  
  //Gif fire; 
  int armAngle = -50;
  int angleChange = 1;
  final int ANGLE_LIMIT = 80;
  int legAngle -75;
  
  float tall;
  float wide;
  
  Ball(float tall, float wide) 
  {
    this.tall;
    this.wide;
    //fire = new Gif(this, "fire0.gif");
    //fire.play();
  }
  void drawPeople()
  {
  pushMatrix();
  background(255);
  //image(fire,wide/2.50,tall/20);
  noStroke();
  smooth();
  fill(#ffa500);
  head();
  fill(#5fdef0);
  body();
  leftArm();
  rightArm();
  leftLeg();
  rightLeg();
  popMatrix();
}
  void head(){
  pushMatrix();
  ellipse(wide/2, tall/4, wide/6, tall/6);
  popMatrix();
}

void body(){
  pushMatrix();
  
  triangle(wide/2-wide/10, tall/3, wide/2+wide/10, tall/3, wide/2, tall*4/5);
  popMatrix();
}

void leftArm(){
  pushMatrix();
  translate(wide/2-wide/12, tall/2.5);
  rotate(radians(armAngle));
  triangle(0, 0, 0-wide/4, 0-tall/12, 0-wide/4, 0-tall/20);
  popMatrix();
}

void rightArm(){
  pushMatrix();
  translate(wide/2+wide/12, tall/2.5);
  rotate(radians(-armAngle));
  triangle(0, 0, 0+wide/4, 0-tall/12, 0+wide/4, 0-tall/20);
  popMatrix();
}

void rightLeg(){
  pushMatrix();
  translate(wide/2+wide/45, tall*3.5/5);
  rotate(radians(legAngle));
  triangle(0,0, wide/18, tall/5, wide/10, tall/5);
  popMatrix();
  
}

void leftLeg(){
  pushMatrix();
  translate(wide/2-wide/45, tall*3.5/5);
    rotate(radians(legAngle));
  triangle(0,0, 0-wide/18, tall/5, 0-wide/10, tall/5);
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
  if (legAngle > ANGLE_LIMIT || legAngle <= -100)
  {
    angleChange = -angleChange;
    legAngle += angleChange;
  }
}
}
