float x, y;

void setup()
{
  size(400,400);
  background(251,247,210);
}

void draw()
{
   legs();
   stopSign();
   man();
   hair();
   
}

void legs() {
  stroke(111,68,0);
  ellipse(310,360,10,40);
  fill(111,68,0);
  quad(292.5,335,305,355,310,378,292.5,365);
  noStroke();
  fill(111,68,0);
  quad(240,325,282.5,360,282.5,330,240,280);
  quad(240,325,220,365,210,310,240,280);
  quad(220,310,200,320,189,295,220,280);
  quad(220,365,215,340,190,340,190,350);
  ellipse(190,355,10,30);
  ellipse(195,368,15,5);
  
}

void stopSign()
{
  x = 1;
  y = cos(x);
  pushMatrix();
  translate(287.5,170);
  noStroke();
  scale(x);
  fill(144,181,200);
  rect(-5,30,10,180);
  fill(209,68,0);
  ellipse(0,0,60,60);
  fill(251,247,210);
  rect(-17.5,-5,40,10);
  popMatrix();
}



void man()
{
  stroke(111,68,0);
  
  fill(111,68,0);
 
  ellipse(230,250,60,120);
  ellipse(230,220,60,60);
  fill(121,130,7);
  noStroke();
  rect(220,185,20,100);
  fill(111,68,0);
  
  fill(213,89,78);

  ellipse(230,175,27,30);
  ellipse(222,179,20,10);
 
}

void hair()
{
  fill(118,75,1);
 arc(230,175,27,30,-5*PI/7,PI/4);
  
}