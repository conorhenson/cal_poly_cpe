/** 
* DrawableSquare 
* CPE 102 - 13, Does DrawableSquare stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class DrawableSquare extends Square implements Drawable 
{	
  private int i;
	public DrawableSquare(boolean up, boolean right, boolean down, boolean left, int row, int col)
	{
		super(up, right, down, left, row, col);
	}	
          
          
	public void draw()
	{
                i ++;
                pushMatrix();
                
              
                 
                    if (inView())
                 {
                   fill(139, 69, 19);
                      if (wall(0))
                    {
                      noStroke();
                      pushMatrix();
                      
                      translate(x()+10, y()+5);
                      rotate(i*PI/60);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+27, y()+5);
                      rotate(i*PI/54);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+5);
                      rotate(i*PI/27);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();

                        
                    }
                    if (wall(1))
                    {
                      pushMatrix();
                      translate(x()+44, y()+5);
                      rotate(i*PI/37);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      noStroke();
                      pushMatrix();
                      translate(x()+44, y()+17);
                      rotate(i*PI/20);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+31);
                      rotate(i*PI/10);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+41);
                      rotate(i*PI/6);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();

                    }
                    if (wall(2))
                    {
                      
                      
                       noStroke();
                      pushMatrix();
                      translate(x()+10, y()+41);
                      rotate(i*PI/45);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+27, y()+41);
                      rotate(i*PI/34);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+41);
                      rotate(i*PI/67);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                    }
                    if (wall(3))
                    {
                      
                      pushMatrix();
                      translate(x()+10, y()+5);
                      rotate(i*PI/150);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      noStroke();
                      pushMatrix();
                      translate(x()+10, y()+17);
                      rotate(i*PI/250);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+10, y()+31);
                      rotate(i*PI/28);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+10, y()+41);
                      rotate(i*PI/130);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                    }
                      
                        

                 }
                 if (seen() && !inView())
                 {
                     fill(100, 40, 9);
                    if (wall(0))
                    {
                      
                      noStroke();
                      pushMatrix();
                      translate(x()+10, y()+5);
                      rotate(i*PI/140);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+27, y()+5);
                      rotate(i*PI/127);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+5);
                      rotate(i*PI/30);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();

                        
                    }
                    if (wall(1))
                    {
                      pushMatrix();
                      translate(x()+44, y()+5);
                      rotate(i*PI/2500);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      noStroke();
                      pushMatrix();
                      translate(x()+44, y()+17);
                      rotate(i*PI/500);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+31);
                      rotate(i*PI/5);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+41);
                      rotate(i*PI/53);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();

                    }
                    if (wall(2))
                    {
                      
                      
                       noStroke();
                      pushMatrix();
                      translate(x()+10, y()+41);
                      rotate(i*PI/23);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+27, y()+41);
                      rotate(i*PI/123);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+44, y()+41);
                      rotate(i*PI/223);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                    }
                    if (wall(3))
                    {
                      
                      pushMatrix();
                      translate(x()+10, y()+5);
                      rotate(i*PI/23);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      noStroke();
                      pushMatrix();
                      translate(x()+10, y()+17);
                      rotate(i*PI/35);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+10, y()+31);
                      rotate(i*PI/47);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                      
                      pushMatrix();
                      translate(x()+10, y()+41);
                      rotate(i*PI/147);
                      scale(.04);
                      beginShape();
                        vertex(3,62);
                        bezierVertex(55,106,72,70,98,4);
                        bezierVertex(116,-41,129,-90,82,-94);
                        bezierVertex(14,-107,-52,-121,-123,-55);
                        bezierVertex(-143,-29,-153,5,-88,42);
                        bezierVertex(-67,59,-40,4,-25,25);
                        bezierVertex(-20,42,-13,50,3,63);
                      endShape(OPEN);
                      popMatrix();
                    }}
                    popMatrix();
}
	}



