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
    shade = color(#7A0000);  // TODO_2 use this!
    for (int i=0; i < num; i++) 
    {
      particles.add(new Particle(source, shade+i/2));
    }
  }

  // what to do each frame
  void run() 
  {
    // go through backwards for deletes
    for (int i=particles.size ()-1; i >=0; i--) 
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
    } else 
    {
      return false;
    }
  }
}