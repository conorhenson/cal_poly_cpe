class People
{
  import gifAnimation.*;  
  Gif fire; 
  int armAngle = -50;
  int angleChange = 1;
  final int ANGLE_LIMIT = 80;
  int legAngle -75;
  float big;
  float tall;
  float wide;
  
  Ball(float big, float tall, float wide) 
  {
    this.big;
    this.tall;
    this.wide;
  }
  void drawPeople()
  {
  pushMatrix();
  background(255);
  image(fire,width/2.50,height/20);
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

