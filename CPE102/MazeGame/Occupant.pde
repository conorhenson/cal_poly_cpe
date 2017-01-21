/** 
* Occupant 
* CPE 102 - 13, Does Occupant stuff
* @author Conor Henson CPE 102 - 13
* @version 4/29/16
*/
public abstract class Occupant
{
	private Square square;

	public Occupant()
	{
		//default
	}

	public Occupant(Square start)
	{
		square = start;
	}

	public Square location()
	{
		return square;
	}

	public void moveTo(Square newLoc)
	{
		square = newLoc;
	}
}