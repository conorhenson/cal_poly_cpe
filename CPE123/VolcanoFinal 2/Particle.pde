class Particle 
{
  PVector loc;
  PVector vel;
  PVector accel;
  float r, r2;
  float life, life2, life3;
  color pcolor;

  // constructor
  Particle(PVector start) 
  {
    accel = new PVector(0, 0.03); //gravity
    vel = new PVector(random(-2, 2), random(-0.5, 0), 0);
    pcolor = color(255, 255, 153);
    loc = start.get();  // make a COPY of the start location vector
    r = 28.0;
    r2=28.0;
    life = 150;
  }

  Particle(PVector start, color c)
  {
    accel = new PVector(0, 0.02); //gravity
    vel = new PVector(random(-2.5, 2.5), random(-2, -.8), 0);
    pcolor = c;
    loc = start.get();  // make a COPY of the start location vector
    r = random(36, 49);
    r2 = random(48.0, 62);
    life = 705;
    life2 = 115;
    life3 = 90;
  }
  // TODO_1 define another constructor that allows a particle to start with a given color

  // what to do each frame
  void run() 
  {
    if (life<30) {
      r2 +=.5;
    }
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
    stroke(pcolor);
    fill(pcolor, 70);
    translate(loc.x, loc.y);
    rotate(vel.heading());
    ellipse(0, 0, r2, r); 
    popMatrix();
  }

  // a function to test if a particle is alive
  boolean alive() 
  {
    if (life <= 0.0) 
    {
      return false;
    } else 
    {
      return true;
    }
  }
} //end of particle object definition