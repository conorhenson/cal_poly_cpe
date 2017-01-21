import gifAnimation.*;
class Fire{
  float x1, y1;
  float s;
  Gif fire;
  
  public Fire(float x, float y, float size, Gif g){
    x1 = x;
    y1 = y;
    s = size;
    fire = g;
  }
  void drawFire(){
    pushMatrix();
    translate(x1,y1);
     scale(s);
    image(fire, 0, 0);
    popMatrix();
  }
  void updateF(){
    fire.play();
  }
}
Fire fires;
Fire fires1;
void setup(){
  size(400, 400);
  Gif fire;
  fire = new Gif(this, "animated-fire-image-0379.gif");
  fire.play();
  //X loc, Y loc, Scale, File
  fires = new Fire(200, 200, .5, fire);
  fires1 = new Fire(300, 200, 1, fire);
}
void draw(){
  background(255);
  fires.drawFire();
  fires1.drawFire();

}
