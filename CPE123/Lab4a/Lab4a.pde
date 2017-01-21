void setup(){
  background(230);
  size(350, 500);
  noLoop();
}
void draw(){
  web();
}
void web(){
  //intiate var's
  float x,y = 0;
  float z = .8;
  float w = .4;
  float v = .85;
  //Strands
  x = random(75, 145);
  y = random(100, 200);
  fill(0);
  line(x, 0, 350-x, 500);
  line(350-x, 0, x, 500);
  line(0, y, 350, 500-y);
  line(0, 500-y, 350, y);
  //Connection webbing
  noFill();
  //Top Left webs
  beginShape();
  curveVertex(0, y);
  curveVertex(0, y);
  curveVertex(.66*x,.66*y);
  curveVertex(x, 0);
  curveVertex(x, 0);
  endShape();
  while(z >= .4){
    beginShape();
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(v*x, v*y);
  curveVertex(((.5*width)-(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(((.5*width)-(w*width)),.5*height-z*(.5*(500-2*y)));
  endShape();
  z -= .2;
  w -= .1;
  v += .2;
  }
  z = .8;
  w = .4;
  v = .55;
  //Top Middle webs
  beginShape();
  curveVertex(x, 0);
  curveVertex(x, 0);
  curveVertex(.5*width, .25*y);
  curveVertex(350-x, 0);
  curveVertex(350-x, 0);
  endShape();
  while(z >= .4){
  beginShape();
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(.5*width, y*v);
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)-(w*height));
  endShape();
  z -= .2;
  w -= .1;
  v += .3;
  }
  z = .8;
  w = .4;
  v = .55;
  //Bottem Middle webs
  beginShape();
  curveVertex(x, 500);
  curveVertex(x, 500);
  curveVertex(.5*width, 500-.25*y);
  curveVertex(350-x, 500);
  curveVertex(350-x, 500);
  endShape();
  while(z >= .4){
  beginShape();
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(.5*width, 500 - y*v);
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)+(w*height));
  endShape();
  z -= .2;
  w -= .1;
  v += .3;
  }
  z = .8;
  w = .4;
  v = .85;
  //Top Right webs
  beginShape();
  curveVertex(350, y);
  curveVertex(350, y);
  curveVertex(width-.66*x,.66*y);
  curveVertex(350-x, 0);
  curveVertex(350-x, 0);
  endShape();
  while(z >= .4){
     beginShape();
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)-(w*height));
  curveVertex(width-v*x, v*y);
  curveVertex(((.5*width)+(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(((.5*width)+(w*width)),.5*height-z*(.5*(500-2*y)));
  endShape();
  z -=.2;
  w -= .1;
  v += .2;
  }
  z = .8;
  w = .4;
  v = .65;
  //Right webs
  beginShape();
  curveVertex(350, y);
  curveVertex(350, y);
  curveVertex(350-.5*x, .5 * height);
  curveVertex(350, 500-y);
  curveVertex(350, 500-y);
  endShape();
  while (z >= .4){
    beginShape();
  curveVertex(((.5*width)+(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(((.5*width)+(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(350-v*x, .5*height);
  curveVertex(((.5*width)+(w*width)),.5*height+z*(.5*(500-2*y)));
  curveVertex(((.5*width)+(w*width)),.5*height+z*(.5*(500-2*y)));
  endShape();
  z -=.2;
  w -= .1;
  v += .3;
  }
  z = .8;
  w = .4;
  v = .65;
  //Left webs
  beginShape();
  curveVertex(0, y);
  curveVertex(0, y);
  curveVertex(.5*x,.5*height);
  curveVertex(0, 500-y);
  curveVertex(0, 500-y);
  endShape();
  while( z >= .4){
  beginShape();
  curveVertex(((.5*width)-(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(((.5*width)-(w*width)),.5*height-z*(.5*(500-2*y)));
  curveVertex(x*v, .5*height);
  curveVertex(((.5*width)-(w*width)),.5*height+z*(.5*(500-2*y)));
  curveVertex(((.5*width)-(w*width)),.5*height+z*(.5*(500-2*y)));
  endShape();
  z -= .2;
  w -= .1;
  v += .3;
  }
  z = .8;
  w = .4;
  v = .85;
  //Bottem Left webs
  beginShape();
  curveVertex(0, 500-y);
  curveVertex(0, 500-y);
  curveVertex(.66*x,500-.66*y);
  curveVertex(x, 500);
  curveVertex(x, 500);
  endShape();
  while(z >= .4){ 
  beginShape();
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(.5*width-z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(v*x, 500-v*y);
  curveVertex(((.5*width)-(w*width)),.5*height+z*(.5*(500-2*y)));
  curveVertex(((.5*width)-(w*width)),.5*height+z*(.5*(500-2*y)));
  endShape();
  z -= .2;
  w -= .1;
  v += .2;
  }
  z = .8;
  w = .4;
  v = .85;
  //Bottem Right webs
  beginShape();
  curveVertex(350, 500-y);
  curveVertex(350, 500-y);
  curveVertex(width-.66*x,500-.66*y);
  curveVertex(350-x, 500);
  curveVertex(350-x, 500);
  endShape();
  while (z >= .4){
  beginShape();
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(.5*width+z*(.5*(350-2*x)), (.5*height)+(w*height));
  curveVertex(width-v*x, 500-v*y);
  curveVertex(((.5*width)+(w*width)),.5*height+z*(.5*(500-2*y)));
  curveVertex(((.5*width)+(w*width)),.5*height+z*(.5*(500-2*y)));
  endShape();
  z -= .2;
  w -= .1;
  v += .2;
  }
}

