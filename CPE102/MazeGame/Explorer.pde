import java.awt.event.KeyEvent;
/** 
* Explorer 
* CPE 102 - 13, Does Explorer stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class Explorer extends Occupant
{
	private String name;
	private Maze maze;
        public float lastKey;

	public Explorer(Square location, Maze maze, String name)
	{
		super(location);
		this.maze = maze;
		this.name = name;
		maze.lookAround(location);
	}

	public String name()
	{
		return name;
	}

	public void move(int key)
	{
		Square loc = super.location();
    if (key == KeyEvent.VK_DOWN || key == KeyEvent.VK_KP_DOWN){
       //check for wall and then change row/ col
    	if (!location().wall(Square.DOWN))
    	{
    		moveTo(maze.getSquare(location().row() + 1, location().col()));
                lastKey = PI;
    	} }
    if (key == KeyEvent.VK_UP || key == KeyEvent.VK_KP_UP){
       //check for wall and then change row/ col
    	if (!location().wall(Square.UP))
    	{
    		moveTo(maze.getSquare(location().row() - 1, location().col()));
                lastKey = 0.0;
    	} }
    if (key == KeyEvent.VK_LEFT || key == KeyEvent.VK_KP_LEFT)
      {
       //check for wall and then change row/ col
    	if (!location().wall(Square.LEFT))
    	{
    		moveTo(maze.getSquare(location().row(), location().col() - 1));
                lastKey = 3*PI/2;
    	} }
      if (key == KeyEvent.VK_RIGHT || key == KeyEvent.VK_KP_RIGHT)
     { 
       //check for wall and then change row/ col
    	if (!location().wall(Square.RIGHT))
    	{
    		moveTo(maze.getSquare(location().row(), location().col() + 1));
                lastKey = PI /2;
    	} 
		}
	}
  
  public void moveTo(Square s)
  {
  	super.moveTo(s);
  	s.enter();
  	maze.lookAround(s);
  }
}
