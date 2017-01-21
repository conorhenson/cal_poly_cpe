People peoples;

void setup(){
  size( 400, 400);
  // (Height, Width, head, body and limbs)
  peoples = new People(300,300,color(234,198,157),color(0,0,170));
}

void draw(){
  background(255);
  peoples.drawPeople();
  peoples.updateP();
}
  
