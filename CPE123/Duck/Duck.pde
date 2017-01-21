/* CSC 123 base code for hierarchical duck lab
 * by ZJ Wood - Fall 2011
 * updates by J Workman - Fall 2013
 *
 * TODO: read through the code to make sure you understand what it is doing
 * TODO: add code in order to make the duck have feet that also walk as it animates
 */
PImage img;
PVector Dloc;
PVector dir;
float neckR, wingR, speed;

import gifAnimation.*;  
Gif fire; 

boolean neckDown = true;
boolean wingDown = false;
boolean animateOn = false;

boolean after = false;
PVector MouseXY;
int t = 0;


// normal draw
void draw() 
{
  background(12, 245, 216);
  
  // foreground
  fill(78, 155, 16);
  rect(0, height/2, width, height/2);
  fireW1.run();  
  fireW2.run();
  if (fireW2.dead())
   {
     fireW2 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW1.dead())
   {
     fireW1 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
  
  drawDuck();
 
  if (animateOn) 
  {
     animate();
  }
  
}

// method to control starting the duck over again and control animation on and off
void mousePressed() 
{
  Dloc.x = width*.9;
  animateOn = !animateOn;
}

// code to draw the duck with animation parameters neckR and wingR - other transforms align
// the peices to the correct pivot points
void drawDuck() 
{
    noStroke();
    
    pushMatrix();
      translate(Dloc.x, Dloc.y); // move the entire duck
      scale(2); // scale the entire duck
       pushMatrix();
         translate(-20, 4);
         rotate(wingR);
         translate(-8, 5);
         scale(.3);
         image(img,0,0);
         image(img,20,0);
      popMatrix();
      image(fire,-25,-75);
      fill(245, 226, 12);
      ellipse(0, 0, 40, 30); // body
      
      //draw neck and head with possible animation transforms
      pushMatrix();
        translate(-16, 0); // move back into draw position - structural constant
        rotate(neckR);  // rotate by neckR parameter - control knob
        translate(0, -10); // move neck and head to pivot point - structural constant
        ellipse(0, 0, 10, 18); // neck
        ellipse(0, -7, 14, 14); // head
        fill(0);
        ellipse(0, -9, 4, 4);  // eye
        fill(155, 111, 16);
        triangle(-10, -8, -4, -11, -4, -5); // beak
      popMatrix();
     
      // draw wing with possible animation transforms
      fill(227, 208, 66);
      pushMatrix();
         translate(-8, -5); // move into draw position - structural constant
         rotate(wingR); // animtion parameter to control wing flap - control knob
         translate(14, 0); // move to the pivot point - structural constant
         ellipse(0, 0, 34, 20); // wing
      popMatrix();
     
    popMatrix();          
}
 
//function to update all animation parameters 
void animate() 
{
  // update the duck's global location
  Dloc.x = Dloc.x + dir.x*speed;
  Dloc.y = Dloc.y + dir.y*speed;
  
  // find out how much the neck is rotated to decide which way to rotate
  // these constrain how much the neck moves up and down
  if (neckR < -1) 
  {
     neckDown = false;
  } 
  else if (neckR > 0.3) 
  {
     neckDown = true;
  }
 
  // depending on which way we need to rotate, do so
  if (neckDown) 
  {
     neckR -= .03; 
  } 
  else 
  {
    neckR += .03;
  }
  
  // find out how much the wing is rotated to decide which way to rotate
  // these constrain how much the wing moves up and down
  if (wingR < -1.1) 
  {
     wingDown = true;
  } 
  else if (wingR > 0.3) 
  {
     wingDown = false;
  }
 
  if (wingDown) 
  {
     wingR += .03; 
  } 
  else 
  {
     wingR -= .03;
  }
}
class Particle 
{
   PVector loc;
   PVector vel;
   PVector accel;
   float r;
   float life;
   color pcolor;
   
   
   // constructor
   Particle(PVector start) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-2, 2), random(-5, 0), 0);
      pcolor = color(random(255), random(255), random(255));
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = random(75, 150);
   }
    
   // TODO_1 define another constructor that allows a particle to start with a given color
    Particle(PVector start, color c) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-2, 2), random(-5, 0), 0);
      pcolor = c;
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = random(75, 125);
   }
   // what to do each frame
   void run() 
   {
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
       
       stroke(pcolor, life);
       fill(pcolor, life);
       translate(loc.x, loc.y);
       //ellipse(0, 0, r, r);
       rotate(.1*life/PI);
       triangle(5,5,10,10,0,10);
      popMatrix();
   }
    
    // a function to test if a particle is alive
   boolean alive() 
   {
      if (life <= 0.0) 
      {
         return false;
      } 
      else 
      {
         return true;
      }
   }
} //end of particle object definition

// now define a group of particles as a particleSys
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
      shade = color(random(255), random(255), random(255));  // TODO_2 use this!
      for (int i=0; i < num; i++) 
      {
         particles.add(new Particle(source, shade));
      }
   }
    
   // what to do each frame
   void run() 
   {
      // go through backwards for deletes
      for (int i=particles.size()-1; i >=0; i--) 
      {
         Particle p = (Particle)particles.get(i);
          
         // update each particle per frame
         p.run();
         if (!p.alive()) // what is that '!' thingy??
         {
            particles.remove(i);
         }
      }
       for (int i=particles.size()/2-1; i >=0; i--) 
      {
         Particle p = (Particle)particles.get(i);
          
         // update each particle per frame
         p.run();
         if (!p.alive()) // what is that '!' thingy??
         {
            particles.remove(i);
         }
      }
      for (int i=particles.size()/3-1; i >=0; i--) 
      {
         Particle p = (Particle)particles.get(i);
          
         // update each particle per frame
         p.run();
         if (!p.alive()) // what is that '!' thingy??
         {
            particles.remove(i);
         }
      }
      for (int i=particles.size()/4-1; i >=0; i--) 
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
      } 
      else 
      {
         return false;
      }
   }
}

// declare a particle system
PSys fireW1;
PSys fireW2;
  
// normal set up
void setup() 
{
  size(400, 400);
  colorMode(RGB, 255, 255, 255, 100);
   fire = new Gif(this, "animated-fire-image-0379.gif");
  fire.play();
   // start a new particle system
   fireW1 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   fireW2 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
  smooth();
  img = loadImage("duck.png");
  neckR = 0;
  wingR =-.2;
  Dloc = new PVector(width*.9, height/2);
  dir = new PVector(-1, 0);
  speed = 0.5;
}

