Starfield s;
Sprite[] planets = new Sprite[5];
PVector vec;
float x, y;
void setup(){
   size(800,800);
   vec = new PVector(1,1);
   s = new Starfield(3000);
}
void draw(){
  background(0);
  s.draw();
  
  }
  
}
void mousePressed(){
  for(int i = 0; i < planets.length; i++){
    vec = new PVector(random(-1, 1), random(-1, 1));
  }
}

    
    
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
