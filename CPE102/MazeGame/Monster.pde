/** 
* Monster 
* CPE 102 - 13, Does Monster stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class Monster extends RandomOccupant
{
	public Monster(Maze maze)
	{
		super(maze);
	}

	public Monster(Maze maze, long seed)
	{
		super(maze, seed);
	}

	public Monster(Maze maze, Square location)
	{
		super(maze, location);
	}
}