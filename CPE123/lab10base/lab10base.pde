// Base particle code for CSC 123 Lab 9
// Done TODO_1: add a new particle constructor that will take in a starting color for a particle
// Done TODO_2: add code to the Particle System to call the new Particle constructor
// Done TODO_3: add code so that the fire work explodes where the mouse clicks (use the existing firework, just restart a new system where the moust clicks)
// Done TODO_4: add code to start another firework when the old one dies
// Done TODO_5: add code in order to have the shading/transparency and or shape of the particle change over time
//         or depending on velocity
// TODO_6: add more then one firework
// define a particle
boolean after = false;
PVector MouseXY;
int t = 0;
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
PSys fireW3;
PSys fireW4;
PSys fireW5;
Psys fireW6;

void setup() 
{
   size(1300,1300);
   
   // range for the alpha is 0-100
   colorMode(RGB, 255, 255, 255, 100);
   
   // start a new particle system
   fireW1 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   fireW2 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
   fireW3 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
   fireW4 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
   fireW5 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
   fireW6 = new PSys(50, new PVector(random(20,width-20), random(50, height/2)));
   





   frameRate(40);
}

void draw() 
{
   background(0);
   
   // run the particle system
   fireW1.run();  
   fireW2.run();
   fireW3.run();
   fireW4.run();
   fireW5.run();
   fireW6.run();
   if (fireW5.dead())
   {
     fireW5 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW6.dead())
   {
     fireW6 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW4.dead())
   {
     fireW4 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW3.dead())
   {
     fireW3 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW2.dead())
   {
     fireW2 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (fireW1.dead())
   {
     fireW1 = new PSys(50, new PVector(random(50,width-50), random(50, height/2)));
   }
   if (after == true){
    t++;
  
  if( t >= 40){
   fireW2 = new PSys(125, new PVector(MouseXY.x-115, MouseXY.y-115));
   fireW3 = new PSys(125, new PVector(MouseXY.x, MouseXY.y-150));
   fireW4 = new PSys(125, new PVector(MouseXY.x+115, MouseXY.y-115));
   fireW2.run();
   fireW3.run();
   fireW4.run();
  after = false;
  t = 0;
  }
     }
   }
   // TODO_4 add code to start a new particle system once the old one dies
    


// TODO_3 add a mouse click function
void mousePressed(){
  fireW1 = new PSys(50, new PVector(mouseX, mouseY));
  MouseXY = new PVector(mouseX, mouseY);
  after = true;
  }
  
