import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lab4a extends PApplet {

public void setup(){
  background(230);
  size(350, 500);
  noLoop();
}
public void draw(){
  web();
}
public void web(){
  //intiate var's
  float x,y = 0;
  float z = .8f;
  float w = .4f;
  float v = .85f;
  //Strands
  x = random(75, 145);
  y = random(100, 200);
  fill(0);
  line(x, 0, 350-x, 500);
  line(350-x, 0, x, 500);
  line(0, y, 350, 500-y);
  line(0, 500-y, 350, y);
  //Connection webbing
  noFill();
  //Top Left webs
  beginShape();
  curveVertex(0, y);
  curveVertex(0, y);
  curveVertex(.66f*x,.66f*y);
  curveVertex(x, 0);
  curveVertex(x, 0);
  endShape();
  while(z >= .4f){
    beginShape();
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(v*x, v*y);
  curveVertex(((.5f*width)-(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)-(w*width)),.5f*height-z*(.5f*(500-2*y)));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .2f;
  }
  z = .8f;
  w = .4f;
  v = .55f;
  //Top Middle webs
  beginShape();
  curveVertex(x, 0);
  curveVertex(x, 0);
  curveVertex(.5f*width, .25f*y);
  curveVertex(350-x, 0);
  curveVertex(350-x, 0);
  endShape();
  while(z >= .4f){
  beginShape();
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(.5f*width, y*v);
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .3f;
  }
  z = .8f;
  w = .4f;
  v = .55f;
  //Bottem Middle webs
  beginShape();
  curveVertex(x, 500);
  curveVertex(x, 500);
  curveVertex(.5f*width, 500-.25f*y);
  curveVertex(350-x, 500);
  curveVertex(350-x, 500);
  endShape();
  while(z >= .4f){
  beginShape();
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(.5f*width, 500 - y*v);
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .3f;
  }
  z = .8f;
  w = .4f;
  v = .85f;
  //Top Right webs
  beginShape();
  curveVertex(350, y);
  curveVertex(350, y);
  curveVertex(width-.66f*x,.66f*y);
  curveVertex(350-x, 0);
  curveVertex(350-x, 0);
  endShape();
  while(z >= .4f){
     beginShape();
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)-(w*height));
  curveVertex(width-v*x, v*y);
  curveVertex(((.5f*width)+(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)+(w*width)),.5f*height-z*(.5f*(500-2*y)));
  endShape();
  z -=.2f;
  w -= .1f;
  v += .2f;
  }
  z = .8f;
  w = .4f;
  v = .65f;
  //Right webs
  beginShape();
  curveVertex(350, y);
  curveVertex(350, y);
  curveVertex(350-.5f*x, .5f * height);
  curveVertex(350, 500-y);
  curveVertex(350, 500-y);
  endShape();
  while (z >= .4f){
    beginShape();
  curveVertex(((.5f*width)+(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)+(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(350-v*x, .5f*height);
  curveVertex(((.5f*width)+(w*width)),.5f*height+z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)+(w*width)),.5f*height+z*(.5f*(500-2*y)));
  endShape();
  z -=.2f;
  w -= .1f;
  v += .3f;
  }
  z = .8f;
  w = .4f;
  v = .65f;
  //Left webs
  beginShape();
  curveVertex(0, y);
  curveVertex(0, y);
  curveVertex(.5f*x,.5f*height);
  curveVertex(0, 500-y);
  curveVertex(0, 500-y);
  endShape();
  while( z >= .4f){
  beginShape();
  curveVertex(((.5f*width)-(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)-(w*width)),.5f*height-z*(.5f*(500-2*y)));
  curveVertex(x*v, .5f*height);
  curveVertex(((.5f*width)-(w*width)),.5f*height+z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)-(w*width)),.5f*height+z*(.5f*(500-2*y)));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .3f;
  }
  z = .8f;
  w = .4f;
  v = .85f;
  //Bottem Left webs
  beginShape();
  curveVertex(0, 500-y);
  curveVertex(0, 500-y);
  curveVertex(.66f*x,500-.66f*y);
  curveVertex(x, 500);
  curveVertex(x, 500);
  endShape();
  while(z >= .4f){ 
  beginShape();
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(.5f*width-z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(v*x, 500-v*y);
  curveVertex(((.5f*width)-(w*width)),.5f*height+z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)-(w*width)),.5f*height+z*(.5f*(500-2*y)));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .2f;
  }
  z = .8f;
  w = .4f;
  v = .85f;
  //Bottem Right webs
  beginShape();
  curveVertex(350, 500-y);
  curveVertex(350, 500-y);
  curveVertex(width-.66f*x,500-.66f*y);
  curveVertex(350-x, 500);
  curveVertex(350-x, 500);
  endShape();
  while (z >= .4f){
  beginShape();
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(.5f*width+z*(.5f*(350-2*x)), (.5f*height)+(w*height));
  curveVertex(width-v*x, 500-v*y);
  curveVertex(((.5f*width)+(w*width)),.5f*height+z*(.5f*(500-2*y)));
  curveVertex(((.5f*width)+(w*width)),.5f*height+z*(.5f*(500-2*y)));
  endShape();
  z -= .2f;
  w -= .1f;
  v += .2f;
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lab4a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
