/** 
* DrawableExplorer 
* CPE 102 - 13, Does DrawableExplorer stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
import java.awt.event.KeyEvent;

public class DrawableExplorer extends Explorer implements Drawable
{
  
  
	public DrawableExplorer(Square location, Maze maze, String name)
	{
		super(location, maze, name);
	}

	public void draw()
	{
           
           pushMatrix();
           translate(location().x()+25, location().y()+25);
           rotate(lastKey);
           scale(.2);
           noStroke();
           
//Shape 1
fill(255);
beginShape();
  vertex(-22,31);
  bezierVertex(-41,-14,3,-18,3,-64);
  bezierVertex(2,-17,45,-18,23,30);
  bezierVertex(7,36,-11,34,-22,32);
endShape(OPEN);
//Shape 2
fill(255,0,0);
beginShape();
  vertex(29,4);
  bezierVertex(26,9,35,-3,52,29);
  bezierVertex(30,21,22,31,27,4);
endShape(OPEN);
//Shape 3
fill(255,0,0);
beginShape();
  vertex(-54,27);
  bezierVertex(-48,6,-35,1,-26,4);
  bezierVertex(-24,29,-31,24,-53,28);
endShape(OPEN);
//Shape 4
fill(#F66600);
beginShape();
  vertex(0,93);
  bezierVertex(-9,-24,70,121,19,31);
  bezierVertex(4,33,-6,33,-20,33);
  bezierVertex(-52,110,-6,-4,0,93);
endShape(OPEN);
//Shape 5
fill(255,255,0);
beginShape();
  vertex(1,-11);
  bezierVertex(6,-11,10,-6,10,0);
  bezierVertex(10,10,6,10,1,10);
  bezierVertex(-3,10,-7,5,-7,0);
  bezierVertex(-7,-6,-3,-11,1,-11);
endShape(OPEN);

 
           popMatrix();
	}
}
