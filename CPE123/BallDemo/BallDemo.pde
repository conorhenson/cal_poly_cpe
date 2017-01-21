Ball[] balls;
int numB;

void setup()
{
   size(400, 400);
   
   numB = 10;
   balls = new Ball[numB];
   
   for (int i=0; i<numB; i++)
   {
      balls[i] = new Ball(random(50,width-50), 
                          random(50,height-50),
                          color(random(255),random(255),random(255)),
                          new PVector(random(-3,3), random(-3,3)),
                          random(10,50));
   }
}

void draw()
{
   background(128);
   
   for (int i=0; i<numB; i++)
   {
      balls[i].drawB();
      balls[i].updateB();
   }
}
   
   
   
   
                
