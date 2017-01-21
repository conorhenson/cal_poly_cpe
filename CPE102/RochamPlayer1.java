import java.util.Random;

public class RochambeauPlayer1
{
	private String name; 
	private String lT = "No Throw";
	private int wins;
	private int seed;
	private Random thrower;

	public RochambeauPlayer1(String name, int seed)
	{
		this.name = name;
		this.seed = seed;
		thrower = new Random();
    thrower.setSeed(seed);
	}
	public RochambeauPlayer1(String name)
	{
		this.name = name;
		thrower = new Random();
	}
	public int makeThrow()
	{
		if (lT == "No Throw")
		{
			int t = thrower.nextInt(3);
			if (t == 0)
    {
    	lT = "Rock";
    }
    else if (t == 1) 
    {
    	lT = "Paper";
    }
    else
    {
    	lT = "Scissors";
    }
    return t;
		}
		else
		{
			if (lT == 0)
			{
				return 1;
			}
			else if (lT == 1)
			{
				return 2;
			}
			else
			{
				return 0;
			}
		}
    
  }
  public int makeThrow(int throwType)
  {
  	if (throwType == 0)
    {
    	lT = "Rock";
    }
    else if (throwType == 1) 
    {
    	lT = "Paper";	
    }
    else if (throwType == 2)
    {
    	lT = "Scissors";
    }
    return throwType;
  }
	public String getName()
	{
		return name;
	}
	public int getWins()
	{
    return wins;
	}
	public void incrementWins()
	{
		wins ++;
	}
	public String toString()
	{
		if (wins == 1)
		{
			return name + " has " + wins + " win.";
		}
		else
		{
			return name + " has " + wins + " wins.";
		}
	}
	public String lastThrow()
	{
		return lT;
	}
}