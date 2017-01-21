People peoples;

void setup(){
  size( 400, 400);
  peoples = new People(300,300,color(234,198,157),color(0,0,170));
}

void draw(){
  peoples.drawPeople();
  peoples.updateP();
}
  
