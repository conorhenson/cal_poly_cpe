/** 
* Square 
* CPE 102 - 13, Does square stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public class Square 
{
	public static final int SQUARE_SIZE = 50;
  public static final int UP = 0;
  public static final int RIGHT = 1;
	public static final int DOWN = 2;
	public static final int LEFT = 3;
	private boolean[] wallArray = new boolean[4];
	private boolean seen;
	private boolean inView;
	private int row;
	private int col;
	private Treasure treasure = null;

	public Square(boolean up, boolean right, boolean down, boolean left, int row, int col)
	{
		wallArray[0] = up;
		wallArray[1] = right;
		wallArray[2] = down;
		wallArray[3] = left;
		this.row = row;
		this.col = col;
	}

	public boolean wall(int direction)
	{
		return wallArray[direction];
	}

	public boolean seen()
	{
		return seen;
	}

	public boolean inView()
	{
		return inView;
	}

	public int row()
	{
		return row;
	}

	public int col()
	{
		return col;
	}

	public Treasure treasure()
	{
		return treasure;
	}

	public int x() 
	{
		return col * SQUARE_SIZE;
	}

	public int y()
	{
		return row * SQUARE_SIZE;
	}

	public void setInView(boolean inView)
	{
		this.inView = inView;
		if (inView)
		{
			seen = inView;
		}
	}

	public void setTreasure(Treasure t)
	{
		treasure = t;
	}

	public void enter()
	{
		if (treasure != null)
		{
		  treasure.setFound();
		}
	}
}