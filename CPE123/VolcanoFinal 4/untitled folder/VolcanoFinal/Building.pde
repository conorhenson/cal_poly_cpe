class Building {
  float startX, size, h;
  Block[] blocks;
  Building(float startX, float size, int h, int blockSize) {
    this.startX = startX;
    this.size = size;
    this.h = h;
    int numCols = (int)size/blockSize;
    int numRows = h/blockSize;
    int up = 600;
    int numWindows = (int)random(1, 3);
    ArrayList<PVector> windows = new ArrayList<PVector>();
    for (int i  = 0; i < numWindows; i++) {
      windows.add(new PVector((int)random(numCols-1), (int)random(numRows-1)));
    }
    blocks = new Block[(numCols)*(numRows)];
    for (int y = 0; y < numRows; y++) {
      up -= blockSize;
      for (int x = 0; x < numCols; x++) {
        int loc = numCols*y +x;
        color blockC = color(175, 115, 75);
        for (int i = 0; i < numWindows; i++) {
          if ((windows.get(i).x == x || windows.get(i).x == x+1) && (windows.get(i).y == y || windows.get(i).y == y+1)) {
            blockC = color(255);
          }
        }
        blocks[loc] = new Block(new PVector(startX+(x*blockSize), up), blockSize, blockSize, (x*blockSize)+(y*blockSize*(5))+(y+1)*(int)random(0, 50), blockC);
      }
    }
  }
  void draw() {
    int c = 0;
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].draw();
    }
  }
}