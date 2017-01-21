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

public class Lab4b extends PApplet {

float x,y = 0;
public void setup(){
  background(225, 178, 255);
  size(400, 400);
  noLoop();
}
public void draw(){
  face();
}
public void face(){
  
  for ( int i = 0; i <= 250; i++){
	//Making eye
	pushMatrix();
	x = random(350);
	y = random(350);
	translate(x, y);
	rotate(radians(random(-90, 90)));
	//back of eye
	stroke(0);
	fill(255);
	beginShape();
	curveVertex(x, y);
	curveVertex(x, y);
	curveVertex(x+25, y+10);
	curveVertex(x+50, y);
	curveVertex(x+25, y-10);
	curveVertex(x, y);
	curveVertex(x, y);
	endShape(CLOSE);
	//eye color
	fill(random(255), random(255), random(255));
	noStroke();
	ellipse(x+25, y, 17, 17);
	//pupil
	fill(10, 10, 10);
	ellipse(x+25, y, 12, 12);
	popMatrix();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lab4b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
