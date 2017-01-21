/** 
* DrawableMaze 
* CPE 102 - 13, Does DrawableMaze stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class DrawableMaze extends Maze implements Drawable
{
  Starfield s = new Starfield(750);
 
	public DrawableMaze(DrawableSquare[][] maze, int rows, int cols)
	{
		super(maze, rows, cols);
	}

	public void draw()
	{
          background(0);
          s.draw();
          for(int i = 0; i < rows(); i++)
          {
            for(int j = 0; j < cols(); j++)
            {
              ((Drawable)getSquare(j, i)).draw();
            }
          }
          
          for(int i = 0; i < getNumRandOccupants(); i ++)
          {
            if(getRandomOccupant(i).location().inView()){
          ((Drawable)getRandomOccupant(i)).draw();
            }
          }
          ((Drawable)getExplorer()).draw();
	}
    class Sprite {
      float x, y, vel, dir;
      color c;
      PVector vec;
      public Sprite(float x, float y, color c,PVector vec){
        this.x = x;
        this.y = y;
        this.vel = vec.x;
        this.dir = vec.y;
        this.c = c;
        
        
      }
    } 
    class Star {
      float x, y, z;
      Star( float x, float y, float z ) {
        this.x = x;
        this.y = y;
        this.z = z;
      }
    }
    class Starfield {
      public Star stars[];
      public int count;
    
      public Starfield( int count ) {
        this.count = count;
        stars = new Star[count];
        for ( int i =0; i < count; i++) {
          stars[i] = new Star( random( width ), random( height ), random( 10 ));
        }
      }
    
      public void draw() {
        strokeWeight( 3 );
        for ( int i =0; i < count; i++) {
          stroke( stars[i].z * 25 );
          point( stars[i].x, stars[i].y );
    
          stars[i].x -= stars[i].z;
          if (stars[i].x < 0) { 
            stars[i] = new Star( width, random( height ), sqrt(random( 100 )));
          }
        }
      }
}
}
