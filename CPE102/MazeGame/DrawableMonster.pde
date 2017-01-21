/** 
* DrawableMonster 
* CPE 102 - 13, Does DrawableMonster stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class DrawableMonster extends Monster implements Drawable
{
  private float j;
  private float i;
	public DrawableMonster(Maze maze)
	{
		super(maze);
	}

	public DrawableMonster(Maze maze, long seed)
	{
		super(maze, seed);
	}

	public DrawableMonster(Maze maze, Square location)
	{
		super(maze, location);
	}

	public void draw()
	{
          float z = 2 + 2*cos(i  * PI);
          float f = 2 + 2* sin(i * PI);
          i += .02;
          j += .1;
          
         pushMatrix();
         noStroke();
         translate(location().x() +Square.SQUARE_SIZE / 2 + f, location().y() +Square.SQUARE_SIZE / 2 + z);
         ellipseMode(CENTER);
         fill(255, 0, 0);
         ellipse(0, 20, 7, 7);
         fill(128);
         ellipse(0, 11, 30, 20);
         ellipse(0, 2, 40, 30);
         fill(200);
         ellipse(0, 0, 40, 25);
         fill(128);
         ellipse(0, 0, 20, 7);
         noFill();
         tint(0, 153, 204, 126);
         //stroke(.1);
         beginShape();
         curveVertex(-10, 0);
         curveVertex(-10, 0);
         curveVertex(-7, -15);
         curveVertex(0, -20);
         curveVertex(7, -15);
         curveVertex(10, 0);
         curveVertex(10, 0);
         endShape();
         fill(0, 255, 0);
         ellipse(0, -5, 10, 10);
         fill(255, 255, 0);
         ellipse(0, 7, 7, 3);
         ellipse(-15, 0, 7, 3);
         ellipse(15, 0, 7, 3);
         
 
 
 popMatrix();
 

	}
}
