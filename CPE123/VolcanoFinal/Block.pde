class Block {
  PVector vel = new PVector(0, 1);
  PVector loc, expectedLoc;
  int sizeX, sizeY;
  color c;
  public Block(PVector loc, int sizeX, int sizeY, int offset, color c) {
    this.loc = new PVector(loc.x, 0-offset);
    expectedLoc = loc;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.c = c;
  }
  void draw() {
    if (loc.y < expectedLoc.y) {
      loc.y += vel.y;
    }
    fill(c);
    rect(loc.x, loc.y, sizeX, sizeY);
  }
}