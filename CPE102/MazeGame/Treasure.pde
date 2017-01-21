/** 
* Treasure 
* CPE 102 - 13, Does treasure stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/

public class Treasure extends RandomOccupant
{
	private boolean found;

	public Treasure(Maze maze)
	{
		super(maze);
		location().setTreasure(this);
	}
	public Treasure(Maze maze, long seed)
	{
		super(maze, seed);
		location().setTreasure(this);

	}

	public Treasure(Maze maze, Square location)
	{
		super(maze, location);
		location().setTreasure(this);
	}

	public boolean found()
	{
		return found;
	}

	public void setFound()
	{
		found = true;
	}

	public void move()
	{
	}
}