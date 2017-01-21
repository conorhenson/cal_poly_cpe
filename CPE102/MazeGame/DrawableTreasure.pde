/** 
* DrawableTreasure 
* CPE 102 - 13, Does DrawableTreasure stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class DrawableTreasure extends Treasure implements Drawable
{
	public DrawableTreasure(Maze maze)
	{
		super(maze);
	}

	public DrawableTreasure(Maze maze, long seed)
	{
		super(maze, seed);
	}

	public DrawableTreasure(Maze maze, Square location)
	{
		super(maze, location);
	}

	public void draw()
	{
          //Shape 1
          if(found()){
          pushMatrix();
          translate(location().x(), location().y()-6);
          scale(.12);
beginShape();
pushMatrix();
fill(255,0,0);
  vertex(229,122);
  bezierVertex(282,122,325,167,325,223);
  bezierVertex(325,279,282,325,229,325);
  bezierVertex(176,325,134,279,134,223);
  bezierVertex(134,167,176,122,229,122);
  popMatrix();
endShape(OPEN);
beginShape();
pushMatrix();
fill(255,255,0);
  vertex(254,212);
  bezierVertex(220,164,320,201,300,171);
  bezierVertex(258,175,243,162,270,143);
  bezierVertex(257,131,281,128,230,122);
  bezierVertex(223,139,195,139,202,163);
  bezierVertex(207,181,172,192,176,175);
  bezierVertex(180,160,135,181,142,198);
  bezierVertex(154,219,162,232,194,229);
  bezierVertex(230,230,200,267,173,305);
  bezierVertex(173,305,173,305,173,305);
  bezierVertex(190,319,228,339,285,305);
  bezierVertex(309,277,319,237,298,230);
  bezierVertex(281,224,266,234,255,213);
  popMatrix();
endShape(OPEN);
popMatrix();
          }else{
            pushMatrix();
          translate(location().x(), location().y()-6);
          scale(.12);
beginShape();
pushMatrix();
fill(0,0,255);
  vertex(229,122);
  bezierVertex(282,122,325,167,325,223);
  bezierVertex(325,279,282,325,229,325);
  bezierVertex(176,325,134,279,134,223);
  bezierVertex(134,167,176,122,229,122);
  popMatrix();
endShape(OPEN);
beginShape();
pushMatrix();
fill(0,255,0);
  vertex(254,212);
  bezierVertex(220,164,320,201,300,171);
  bezierVertex(258,175,243,162,270,143);
  bezierVertex(257,131,281,128,230,122);
  bezierVertex(223,139,195,139,202,163);
  bezierVertex(207,181,172,192,176,175);
  bezierVertex(180,160,135,181,142,198);
  bezierVertex(154,219,162,232,194,229);
  bezierVertex(230,230,200,267,173,305);
  bezierVertex(173,305,173,305,173,305);
  bezierVertex(190,319,228,339,285,305);
  bezierVertex(309,277,319,237,298,230);
  bezierVertex(281,224,266,234,255,213);
  popMatrix();
endShape(OPEN);
popMatrix();}
	}
}

