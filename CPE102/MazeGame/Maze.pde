import java.util.*;
/**
 * Maze
 * Class that contains all the logic to model a Maze with Treasures, Monsters, and an Explorer.
 * 
 * @author Conor Henson
 * @version 4/29/16
 */
public class Maze
{
   // named constants
   public static final int ACTIVE = 0;
   public static final int EXPLORER_WIN = 1;
   public static final int MONSTER_WIN = 2;
    
    // instance variables
   private Square[][] squares;
   private ArrayList<RandomOccupant> randomOccupants;
   private Explorer explorer;
   private int rows;
   private int cols;


   /**
    * Constructor for objects of class Maze
    */
   public Maze(Square[][] squares, int rows, int cols)
   {
      this.squares = squares;
      this.rows = rows;
      this.cols = cols;
      this.randomOccupants = new ArrayList<RandomOccupant>();
   }
	
   // QUERIES
   public Square getSquare(int row, int col) { return squares[row][col]; }
   public int rows() {return rows;}
   public int cols() {return cols;}
   public String explorerName() {return explorer.name();}
   public Explorer getExplorer() {return explorer;}
    
   public RandomOccupant getRandomOccupant(int index) 
   {
     return randomOccupants.get(index);
  }
   public int getNumRandOccupants() 
   {
     return randomOccupants.size();
  }
	
   public void addRandomOccupant(RandomOccupant ro)
   {  
    randomOccupants.add(ro);
   }
	
   public void setExplorer(Explorer e) {explorer = e;}
	
   public void explorerMove(int key)
   {
      explorer.move(key);
   }
	
   public void randMove()
   {
    for (int i = 0; i < randomOccupants.size(); i ++)
    {
      randomOccupants.get(i).move();
    }
   }
	
   /**
    * Returns the status of the game.
    *
    * If all treasures have been found, return EXPLORER_WIN.
    * If not, check each maze occupant, if it is a Monster and
    *    it is in the same location as the Explorer, return
    *    MONSTER_WIN.  Note that you can use == to check locations, do you know why?
    * Otherwise, return ACTIVE.
    */
   public int gameStatus()
   {
    int status = ACTIVE;
    if (foundAllTreasures())
    {
      return EXPLORER_WIN;
    }
    for (int i = 0; i < randomOccupants.size(); i ++)
    {
      Object o = randomOccupants.get(i);
      if(o instanceof Monster)
      {
        if (((Monster)o).location() == explorer.location())
        {
          return MONSTER_WIN;
        }
      }
    } 
      return status;
   }
	
   private boolean foundAllTreasures()
   {
      boolean foundAll = true;
      for (int i = 0; i < randomOccupants.size(); i ++)
      {
        Object o = randomOccupants.get(i);
        if(o instanceof Treasure)
        {
          if(!((Treasure)o).found())
          {
            return false;
          }
        }
      }           
      return foundAll;
   }
    
   public void lookAround(Square s)
   {
      int row = s.row();
      int col = s.col();
        
      // Clear what was previously in view
      resetInView();
        
      // Set the current square so that we are viewing it (obviously)
      s.setInView(true);
      if (!s.wall(Square.UP))
      {
        squares[row - 1][col].setInView(true);
        if (!squares[row -1][col].wall(Square.LEFT))
        {
          squares[row - 1][col - 1].setInView(true);
        }
        if (!squares[row - 1][col].wall(Square.RIGHT))
        {
          squares[row - 1][col + 1].setInView(true);
        }
      }
      if (!s.wall(Square.LEFT))
      {
        squares[row][col - 1].setInView(true);
        if (!squares[row][col - 1].wall(Square.DOWN))
        {
          squares[row + 1][col - 1].setInView(true);
        }
        if (!squares[row][col - 1].wall(Square.UP))
        {
          squares[row - 1 ][col - 1].setInView(true);
        }
      }
      if (!s.wall(Square.RIGHT))
      {
        squares[row][col + 1].setInView(true);
        if (!squares[row][col + 1].wall(Square.DOWN))
        {
          squares[row + 1][col + 1].setInView(true);
        }
        if (!squares[row][col + 1].wall(Square.UP))
        {
          squares[row - 1][col + 1].setInView(true);
        }
      }
      if (!s.wall(Square.DOWN))
      {
        squares[row + 1][col].setInView(true);
        if (!squares[row + 1][col].wall(Square.LEFT))
        {
          squares[row + 1][col - 1].setInView(true);
        }
        if (!squares[row + 1][col].wall(Square.RIGHT))
        {
          squares[row + 1][col + 1].setInView(true);
        }
      }
   }
    
   private void resetInView()
   {
      for (int i = 0; i<rows; i++) {
         for (int j = 0; j<cols; j++) {
            squares[i][j].setInView(false);
         }
      }
   }
}




