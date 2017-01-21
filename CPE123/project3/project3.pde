import processing.video.*;

//Conor Henson CPE 123 2015
import processing.video.*;
Capture cam;
PImage pics, back;
int loc;
int q,w, e,r = 0;
int f =1;
int g = 1;
int n =1;
Eye e1, e2;

float result;
PVector v1, t;

 
void setup() {
   size(630, 600);
    
    back = loadImage("project3.jpg");
    pics= loadImage("project3.jpg");
    pics.resize(630, 600);
    back.resize(630, 600);
    smooth();
    noStroke();
    e1 = new Eye(323, 257, 33, 17, 33, 17);
    e2 = new Eye(245, 270, 25, 17, 33, 17); 
    String[] cameras = Capture.list();
    
    
    cam = new Capture(this, cameras[0]);
    
    cam.start();     
  }      


void draw() {
       
     if (f % 2 == 0 && f != 0){
       frameRate(60);
       loadPixels();
   back.loadPixels();
   for (int y=0; y < height; y++) {
      for (int x=0; x < width; x++) {
         loc = x + y*width;
            pixels[loc] = color(brightness(back.pixels[loc]));
         }
      }
      updatePixels();
      pushMatrix();
      translate(width/4,w+height/4);
      drawSpiral(0,0, 40, 1, random(255));
      w ++;
      if(w >= 475)
      w = 0;
      popMatrix();
      pushMatrix();
      translate(width*.75 - e,height/4);
      drawSpiral(0,0, 40, 1, random(255));
      e ++;
      if(e >= 475)
      e = 0;
      popMatrix();
      pushMatrix();
      translate(width*.75,height*.75 - w);
      drawSpiral(0,0, 40, 1, random(255));
      popMatrix();
      pushMatrix();
      translate(width/4 + e,height*.75);
      drawSpiral(0,0, 40, 1, random(255));
      popMatrix();
   }
   else if(g % 2 == 0) {
         loadPixels();
         back.loadPixels();
  for (int y=0; y < height; y++) {
      for (int x=0; x < width; x++) {
         loc = x + y*width;
            pixels[loc] = color(hue(back.pixels[loc]));
         }
      }
     updatePixels();
     
     
       if (cam.available() == true) {
           cam.read();
         }
        image(cam, 307, 247, 33, 19);
        image(cam, 235, 260, 33, 19);
        noFill();
        stroke(0);
        strokeWeight(6);
        ellipse(323, 257, 40, 25);
        ellipse(250, 270, 40, 25);
}

     
else if(n % 2 == 0) {
     loadPixels();
   back.loadPixels();
   for (int y=0; y < height; y++) {
      for (int x=0; x < width; x++) {
         loc = x + y*width;
            pixels[loc] = color(saturation(back.pixels[loc]));
         }
   }
      updatePixels();
      e1.update(mouseX, mouseY);
      e2.update(mouseX, mouseY);
      e1.display();
      e2.display();

  

      }
      else{
        image(pics, 0,0);
   }
   
     
}

//implict ellipse function (modifed example)
float imp_ellipse(float cx, float cy, float w, float h, float x, float y)
{
   return ((cx-x)*(cx-x))/((w/2)*(w/2)) + ((cy-y)*(cy-y))/((h/2)*(h/2)) - 1;
}

void mousePressed(){
  if(mouseX > width/3 && mouseX < width*2/3){
  f++;
  image(pics,0,0);
  g = 1;
  n =1;
  
  
  }
  if(mouseX < width/3){
    g++;
    image(pics,0,0);
    f=1;
    n=1;
  }
  if(mouseX > width*2/3){
    n++;
    image(pics,0,0);
    f=1;
    g=1;

}
}
void drawSpiral(float cx, float cy, float radi, float weight, float c) {
float sx, sy, sradi;
stroke(c);
strokeWeight(weight);
fill(c);
sradi = 0;
for (int i=0; i< 720; i++) {
sx = cx + sradi*sin(radians(i));
sy = cy + sradi*cos(radians(i));
ellipse(sx, sy, sradi/5, sradi/5);
sradi = sradi + radi/720;
}
}
class Eye {
  int ex, ey;
  int size, size1, size2, size3;
  float angle = 0.0;
  Eye(int x, int y, int s, int s1, int s2, int s3) {
     this.ex = x;
     this.ey = y;
     size = s;
     size1 = s1;
     size2 = s2;
     size3 = s3;
 }
  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    ellipse(0, 0, size, size1);
    rotate(angle);
    fill(0);
    ellipse(size/6, 0, size2/3, size2/3);
    popMatrix();

  }

}
