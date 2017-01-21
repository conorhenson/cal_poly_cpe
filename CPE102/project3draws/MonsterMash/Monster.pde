public class Monster
{
private PVector direction = new PVector(0,0);
private float x;
private float y;
private float i;
private float j;

public Monster(float x, float y)
{
  this.x = x;
  this.y = y;
}

public void draw()
{
  float z = 2 + 2*cos(i  * PI);
  float f = 2 + 2* sin(i * PI);
  i += .02;
  j += .1;
  translate(x + f,y + z);
 pushMatrix();
 ellipseMode(CENTER);
 fill(255, 0, 0);
 ellipse(0, 20, 7, 7);
 fill(128);
 ellipse(0, 11, 30, 20);
 ellipse(0, 2, 40, 30);
 fill(200);
 ellipse(0, 0, 40, 25);
 fill(128);
 ellipse(0, 0, 20, 7);
 noFill();
 tint(0, 153, 204, 126);
 beginShape();
 curveVertex(-10, 0);
 curveVertex(-10, 0);
 curveVertex(-7, -15);
 curveVertex(0, -20);
 curveVertex(7, -15);
 curveVertex(10, 0);
 curveVertex(10, 0);
 endShape();
 fill(0, 255, 0);
 ellipse(0, -5, 10, 10);
 fill(255, 255, 0);
 ellipse(0, 7, 7, 3);
 ellipse(-15, 0, 7, 3);
 ellipse(15, 0, 7, 3);
 
 
 
 popMatrix();
 
}

public double getX()
{
  return x;
}

public double getY()
{
  return y;
}

public void move()
{
  x += direction.x;
  y += direction.y;
}

public void setVector(PVector direction)
{
  this.direction = direction;
}
}


