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

public class Lab6 extends PApplet {

int ground = color(140, 115, 70);
int green = color(60, 60, 0);
int sun = color(245, 225, 85);
int sky = color(70, 80, 110);
public void setup()
{
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}
public void draw()
{
	noStroke();
	background(70, 80, 110);
	//draw picuture with implcit lines
	for (int x = 0; x < width; x ++)
	{
		for( int y = 0; y < height; y++)
		{
			sky = color(random(60, 80), random(70, 90), random(100, 120));
			sun = color(random(200, 255), random(200, 255), random(60, 120));
			green = color(random(50, 70), random(50, 70), 0);
			ground = color(random(130, 150), random(105, 125), random(60, 80));
			brush(x,y,sky);
			if (implc_line(200, 300, y, x, 500, 400) < 0.0f && implc_line(200, 300, y, x, 500, 600) > 0.0f && implc_line(300, 300, y, x, 0, 600 ) < 0.0f)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(250, 300, y, x, 350, 300) < 0.0f && implc_line(250, 300, y, x, 350, 400) > 0.0f && implc_line(300, 300, y, x, 0, 600 ) < 0.0f)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(275, 300, y, x, 275, 250) < 0.0f && implc_line(275, 300, y, x, 275, 300) > 0.0f && implc_line(300, 300, y, x, 0, 600 ) < 0.0f)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(300, 300, y, x, 0, 600 ) > 0.0f) 
			{
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
			}
			if (implc_circle(x, y, 200, 100, 50) < 0.0f)
			{
				brush(x,y,sun);
				brush(x,y,sun);
				brush(x,y,sun);
				brush(x,y,sun);
				brush(x,y,sun);
				brush(x,y,sun);

			}
		}
		
	}

}
//Line equation
public float implc_line(float y0, float y1, float y, float x, float x0, float x1)
{
	return((y0 - y1) * x + (x1 - x0) * y + x0 * y1 - x1 * y0);
}
//Circle equation
public float implc_circle(float start_x, float start_y, float cx, float cy, float radius)
{
	return( pow((start_x - cx), 2) + pow((start_y - cy), 2) - pow(radius, 2));
}
public void brush(float x, float y, int c )
{
	
	fill(c);
	ellipse(x, y, random(5, 15), random(3, 10));

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lab6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
