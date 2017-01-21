class Ball
{
   // instance variables
   float cx;
   float cy;
   color BC;
   PVector v;
   float diam;
   
   Ball(float inX, float inY, color inC, PVector inV, float inD)
   {
      cx = inX;
      cy = inY;
      BC = inC;
      v = inV;
      diam = inD;
   }
   
   void drawB()
   {
      fill(BC);
      ellipse(cx, cy, diam, diam);
   }
   
   void updateB()
   {
      cx += v.x;
      cy += v.y;
      
      // check for bounce
      if (cx > width-diam/2 || cx < diam/2)
      {
         v.x = -v.x;
      }
      if (cy > height-diam/2 || cy < diam/2)
      {
         v.y = -v.y;
      }
   }
}
      
      
      
      
      
      
      
       
     
     
     
     
     
     
     
     
