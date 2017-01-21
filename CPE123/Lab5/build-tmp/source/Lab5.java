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

public class Lab5 extends PApplet {

int end;

public void setup() {
	size(400, 400);
	end = 0;		
}

public void draw() {
	frameRate(10);
	float t = 0;
	float x,y;
	background(0);

	strokeWeight(1);
	stroke(random(255), random(255), random(255));
	noFill();
	pushMatrix();
	translate(200, 200);
	beginShape();
	for (int i = 0; i < end; ++i) {
		x = (sin(t)*(pow((float) Math.E, cos(t)) - 200 * cos(4*t) - pow(sin((t/12)), 5)));
		y = (cos(t)*(pow((float) Math.E, cos(t)) - 200 * cos(4*t) - pow(sin((t/12)), 5)));
		vertex(x, y);
		t += (2*PI)/30;
	}
	endShape();

	if (end < 35) {
		end += 1;
		
	} else {
		noLoop();
	}
	popMatrix();
} 
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lab5" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
