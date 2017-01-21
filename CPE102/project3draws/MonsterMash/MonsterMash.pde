/*************************************************************
 * MonsterMash.pde
 *
 * Code to run the sketch for the MonsterMash lab.  This code  
 * takes care of the setup and draw Processing methods.  It also
 * contains code to have the Monster follow a mouse-click.  
 *
 * Students need to provide a Monster.pde file containing the 
 * implementation of the Monster class as specified in the lab.
 *
 * @author: Julie Workman
 * @version: April 25, 2013
 **************************************************************/

// Global Monster reference
Monster m;
Starfield s;
void setup()
{
   size(400,400);  // set the size of the drawing window
   m = new Monster(200, 200);  // create the Monster in the center of the screen
}

void draw()
{
  
   background(50, 155, 50);  // CHANGE this if you like
   m.draw();  // Tell the Monster to draw itself
   m.move();  // Tell the Monster to move itself
}

void mousePressed() 
{
   // Determine the direction between the Monster and the mouse click.
   PVector v = new PVector(mouseX-(int)m.getX(), mouseY-(int)m.getY());
   
   // Normalize the vector to one-pixel length and set the Monster's direction.
   v.normalize();
   m.setVector(v); 
}
class Sprite {
        float x, y, vel, dir;
        color c;
        PVector vec;
        public Sprite(float x, float y, color c,PVector vec){
          this.x = x;
          this.y = y;
          this.vel = vec.x;
          this.dir = vec.y;
          this.c = c;
        }
      } 
        class Star {
          float x, y, z;
          Star( float x, float y, float z ) {
            this.x = x;
            this.y = y;
            this.z = z;
          }
        }
        class Starfield {
          public Star stars[];
          public int count;
        
          public Starfield( int count ) {
            this.count = count;
            stars = new Star[count];
            for ( int i =0; i < count; i++) {
              stars[i] = new Star( random( width ), random( height ), random( 10 ));
            }
          }
        public void draw() {
    strokeWeight( 3 );
    for ( int i =0; i < count; i++) {
      stroke( stars[i].z * 25 );
      point( stars[i].x, stars[i].y );

      stars[i].x -= stars[i].z;
      if (stars[i].x < 0) { 
        stars[i] = new Star( width, random( height ), sqrt(random( 100 )));
      }
    }
  }
}
