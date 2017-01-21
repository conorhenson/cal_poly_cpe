Starfield s;
Sprite[] planets = new Sprite[5];
PImage[] pics = new PImage[5];
PVector vec;

void setup(){
   size(800,800);
   for (int i = 0; i < pics.length; i++){
     pics[i] = loadImage("Planet" + i + ".png");
     pics[i].resize(50, 50);
   }
   for(int i = 0; i < planets.length; i++){
     vec = new PVector(random(-1, 1), random(-1,1));
     planets[i] = new Sprite(random(50,width-50), 
     random(100,height-100),color(random(255),random(255),random(255)), vec);
   }
   s = new Starfield(1250);
}
void draw(){
  background(0);
  s.draw();
  for(int i = 0; i <planets.length; i++){
    fill(planets[i].c);
    planets[i].x += planets[i].vel;
    planets[i].y += planets[i].dir;
    image(pics[i], planets[i].x, planets[i].y);
    if (planets[i].x > width - 50)
      planets[i].vel = -1 * planets[i].vel;
    if (planets[i].x <  0)
      planets[i].vel = -1 * planets[i].vel;
    if (planets[i].y > height - 50)
      planets[i].dir = -1 * planets[i].dir;
    if (planets[i].y <  0)
      planets[i].dir = -1 * planets[i].dir;
    
    }
  
}
void mousePressed(){
  for(int i = 0; i < planets.length; i++){
    vec = new PVector(random(-1,1), random(-1,1));
    planets[i].vel = vec.x;
    planets[i].dir = vec.y;
  }
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
