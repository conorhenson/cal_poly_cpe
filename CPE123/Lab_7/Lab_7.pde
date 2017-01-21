Starfield s;
Sprite[] planets = new Sprite[5];
void setup(){
   size(800,800);
   for(int i = 0; i < planets.length; i++){
     planets[i] = new Sprite(random(width), 
     random(height-100),random(-1,1), random(-1,1),color(random(255),random(255),random(255)));
   }
   s = new Starfield(3000);
}
void draw(){
  background(0);
  s.draw();
  for(int i = 0; i <planets.length; i++){
    fill(planets[i].c);
    planets[i].x += planets[i].vel;
    planets[i].y += planets[i].dir;
    ellipse(planets[i].x, planets[i].y, 100, 100);
  }
  
}
void mousePressed(){
  for(int i = 0; i < planets.length; i++){
  }
}
class Sprite {
  float x, y, vel, dir;
  color c;
  PVector vec;
  public Sprite(float x, float y, float velocity, float direction, color c){
    this.x = x;
    this.y = y;
    this.vel = velocity;
    this.dir = direction;
    this.c = c;
    vec = new PVector(vel,dir);
    
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
