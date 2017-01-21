float x,y = 0;
void setup(){
  background(225, 178, 255);
  size(400, 400);
  noLoop();
}
void draw(){
  face();
}
void face(){
  
  for ( int i = 0; i <= 250; i++){
	//Making eye
	pushMatrix();
	x = random(350);
	y = random(350);
	translate(x, y);
	rotate(radians(random(-90, 90)));
	//back of eye
	stroke(0);
	fill(255);
	beginShape();
	curveVertex(x, y);
	curveVertex(x, y);
	curveVertex(x+25, y+10);
	curveVertex(x+50, y);
	curveVertex(x+25, y-10);
	curveVertex(x, y);
	curveVertex(x, y);
	endShape(CLOSE);
	//eye color
	fill(random(255), random(255), random(255));
	noStroke();
	ellipse(x+25, y, 17, 17);
	//pupil
	fill(10, 10, 10);
	ellipse(x+25, y, 12, 12);
	popMatrix();
  }
}

