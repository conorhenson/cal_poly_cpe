import java.util.Random;
/** 
* RandomOccupant 
* CPE 102 - 13, Makes common stuff for all RandomOccupants
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public abstract class RandomOccupant extends Occupant
{
	private Random random; 
	private Maze maze;

	public RandomOccupant(Maze maze)
	{
		random = new Random();
		this.maze = maze;
		moveTo(maze.getSquare(random.nextInt(maze.rows()), random.nextInt(maze.cols())));
	}

	public RandomOccupant(Maze maze, long seed)
	{
		random = new Random(seed);
		this.maze = maze;
	  moveTo(maze.getSquare(random.nextInt(maze.rows()), random.nextInt(maze.cols())));
	}

	public RandomOccupant(Maze maze, Square location)
	{
		super(location);
		this.maze = maze;
		random = new Random();
	}

	public void move()
	{
		boolean valid = false;
		
		int row = location().row();
		int col = location().col();
		while(!valid)
		{
			int dir = random.nextInt(4);
			if (!location().wall(dir))
			{
				if (dir == Square.UP)
				{
					moveTo(maze.getSquare(location().row() - 1, location().col()));
				}
				else if (dir == Square.RIGHT)
				{
					moveTo(maze.getSquare(location().row(), location().col() + 1));
				}
				else if (dir == Square.DOWN)
				{
					moveTo(maze.getSquare(location().row() + 1, location().col()));
				}
				else if (dir == Square.LEFT)
				{
					moveTo(maze.getSquare(location().row(), location().col() - 1));
				}
				valid = true;
			}
		}
	}
}