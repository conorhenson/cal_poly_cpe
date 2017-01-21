import gifAnimation.*;  
Gif fire; 
int armAngle = -50;
int angleChange = 1;
final int ANGLE_LIMIT = 80;
int legAngle = -75;

void setup(){
  size(500, 500);
  fire = new Gif(this, "fire0.gif");
  fire.play();
}

void draw(){
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

void head(){
  pushMatrix();
  ellipse(width/2, height/4, width/6, height/6);
  popMatrix();
}

void body(){
  pushMatrix();
  
  triangle(width/2-width/10, height/3, width/2+width/10, height/3, width/2, height*4/5);
  popMatrix();
}

void leftArm(){
  pushMatrix();
  translate(width/2-width/12, height/2.5);
  rotate(radians(armAngle));
  triangle(0, 0, 0-width/4, 0-height/12, 0-width/4, 0-height/20);
  popMatrix();
}

void rightArm(){
  pushMatrix();
  translate(width/2+width/12, height/2.5);
  rotate(radians(-armAngle));
  triangle(0, 0, 0+width/4, 0-height/12, 0+width/4, 0-height/20);
  popMatrix();
}

void rightLeg(){
  pushMatrix();
  translate(width/2+width/45, height*3.5/5);
  rotate(radians(legAngle));
  triangle(0,0, width/18, height/5, width/10, height/5);
  popMatrix();
  
}

void leftLeg(){
  pushMatrix();
  translate(width/2-width/45, height*3.5/5);
    rotate(radians(legAngle));
  triangle(0,0, 0-width/18, height/5, 0-width/10, height/5);
  popMatrix();
}
