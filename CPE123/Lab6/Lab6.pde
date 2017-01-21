color ground = color(140, 115, 70);
color green = color(60, 60, 0);
color sun = color(245, 225, 85);
color sky = color(70, 80, 110);
void setup()
{
	size(600, 400);
	ellipseMode(CORNER);
	noLoop();
}
void draw()
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
			if (implc_line(200, 300, y, x, 500, 400) < 0.0 && implc_line(200, 300, y, x, 500, 600) > 0.0 && implc_line(300, 300, y, x, 0, 600 ) < 0.0)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(250, 300, y, x, 350, 300) < 0.0 && implc_line(250, 300, y, x, 350, 400) > 0.0 && implc_line(300, 300, y, x, 0, 600 ) < 0.0)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(275, 300, y, x, 275, 250) < 0.0 && implc_line(275, 300, y, x, 275, 300) > 0.0 && implc_line(300, 300, y, x, 0, 600 ) < 0.0)
			{
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
				brush(x,y,green);
			}
			if (implc_line(300, 300, y, x, 0, 600 ) > 0.0) 
			{
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
				brush(x,y,ground);
			}
			if (implc_circle(x, y, 200, 100, 50) < 0.0)
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
float implc_line(float y0, float y1, float y, float x, float x0, float x1)
{
	return((y0 - y1) * x + (x1 - x0) * y + x0 * y1 - x1 * y0);
}
//Circle equation
float implc_circle(float start_x, float start_y, float cx, float cy, float radius)
{
	return( pow((start_x - cx), 2) + pow((start_y - cy), 2) - pow(radius, 2));
}
void brush(float x, float y, color c )
{
	
	fill(c);
	ellipse(x, y, random(5, 15), random(3, 10));

}
