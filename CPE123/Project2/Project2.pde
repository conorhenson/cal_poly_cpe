float y, y1, y2, y3, y4 = 0;
color c = color(random(255),random(255),random(255));
void setup() {
smooth();
size(400, 400);
}
void draw() {
	background(255, 255, 255);
	smooth();
	hill();
	tree();
	grow12();
	float z = grow12();
	float z1 = grow5();
	float z2 = grow15();
	float z3 = grow20();
	float z4 = grow25();
	branches();
	flowers(z,z1,z2,z3,z4,c);
	
}
void branches()
{
	strokeWeight(1);
	fill(0);
	stroke(0);
	beginShape();
	curveVertex(193, 218);
	curveVertex(193, 218);
	curveVertex(145, 228);
	curveVertex(95, 218);
	curveVertex(95, 218);
	vertex(95, 220);
	curveVertex(95, 220);
	curveVertex(95, 220);
	curveVertex(145, 230);
	curveVertex(193, 220);
	curveVertex(193, 220);
	endShape(CLOSE);

	beginShape();
	curveVertex(190, 200);
	curveVertex(190, 200);
	curveVertex(145, 205);
	curveVertex(120, 200);
	curveVertex(120, 200);
	vertex(120, 202);
	curveVertex(120, 202);
	curveVertex(120, 202);
	curveVertex(145, 207);
	curveVertex(190, 202);
	curveVertex(190, 202);
	endShape(CLOSE);

	beginShape();
	curveVertex(180, 200);
	curveVertex(180, 200);
	curveVertex(175, 170);
	curveVertex(75, 160);
	curveVertex(75, 160);
	vertex(75, 162);
	curveVertex(75, 162);
	curveVertex(75, 162);
	curveVertex(175, 172);
	curveVertex(180, 202);
	curveVertex(180, 202);
	endShape(CLOSE);

	beginShape();
	curveVertex(209, 218);
	curveVertex(209, 218);
	curveVertex(250, 228);
	curveVertex(300, 218);
	curveVertex(300, 218);
	vertex(300, 220);
	curveVertex(300, 220);
	curveVertex(300, 220);
	curveVertex(250, 230);
	curveVertex(209, 220);
	curveVertex(209, 220);
	endShape(CLOSE);

	beginShape();
	curveVertex(210, 200);
	curveVertex(210, 200);
	curveVertex(225, 205);
	curveVertex(205, 120);
	vertex(205, 120);
	curveVertex(205, 120);
	curveVertex(205, 120);
	curveVertex(223, 205);
	curveVertex(210, 200);
	curveVertex(210, 200);
	endShape(CLOSE);

}
void hill()
{
	fill(0);
	stroke(0);
	beginShape();
	curveVertex(0, 400);
	curveVertex(0, 400);
	curveVertex(200, 350);
	curveVertex(400, 400);
	curveVertex(400, 400);
	endShape(CLOSE);
}
void tree()
{
	stroke(0);
	strokeWeight(1);
	beginShape();
	vertex(195, 350);
	vertex(205, 350);
	vertex(210, 200);
	vertex(202, 250);
	vertex(190, 200);
	endShape(CLOSE);
}
void flowers(float z, float z1, float z2, float z3, float z4, color c)
{

	drawSpiral(95, 208, z, .5,c);

	drawSpiral(243, 132, z, .5,c);
	
	drawSpiral(120, 190, z, .5,c);
	
	drawSpiral(75, 150, z, .5,c);
	
	drawSpiral(150, 154, z, .5,c);
	
	drawSpiral(250, 220, z, .5,c);
	
	drawSpiral1(120, 193, z, .5,c);
	
	drawSpiral1(150, 53, z, .5, c);
	
	pushMatrix();
	translate(125, 237);
	rotate(radians(270));
	drawSpiral1(0, 0, z, .5,c);
	popMatrix();
	
	pushMatrix();
	translate(100, 150);
	rotate(radians(90));
	drawSpiral1(0, 0, z, .5, c);
	popMatrix();
	
	pushMatrix();
	translate(300, 240);
	rotate(radians(180));
	drawSpiral(0, 0, z3, 2, c);
	popMatrix();
	
	pushMatrix();
	translate(195, 180);
	rotate(radians(90));
	drawSpiral(0, 0, z, 1, c);
	popMatrix();
	
	pushMatrix();
	translate(280, 210);
	rotate(radians(90));
	drawSpiral1(0, 0, z, .5, c);
	popMatrix();
	
	pushMatrix();
	translate(250, 233);
	rotate(radians(180));
	drawSpiral(0, 0, z1, .5, c);
	popMatrix();
	
	pushMatrix();
	translate(243, 170);
	rotate(radians(90));
	drawSpiral(0, 0, z4, 2,c);
	popMatrix();
	
	pushMatrix();
	translate(280, 170);
	rotate(radians(90));
	drawSpiral(0, 0, z2, 1.5, c);
	popMatrix();



}

void drawSpiral(float cx, float cy, float radi, float weight, color c) {
float sx, sy, sradi;
stroke(c);
strokeWeight(weight);
fill(c);
sradi = 0;
for (int i=0; i< 720; i++) {
sx = cx + sradi*sin(radians(i));
sy = cy + sradi*cos(radians(i));
ellipse(sx, sy, sradi/5, sradi/5);
sradi = sradi + radi/720;
}
}
// x and y swapped
void drawSpiral1(float cx, float cy, float radi, float weight , color c) {
float sx, sy, sradi;
stroke(c);
strokeWeight(weight);
fill(c);
sradi = 0;
for (int i=0; i< 720; i++) {
sy = cx + sradi*sin(radians(i));
sx = cy + sradi*cos(radians(i));
ellipse(sx, sy, sradi/5, sradi/5);
sradi = sradi + radi/720;
}
}
float grow12()
{
	if (y <= 12)
	{
		y += .6;
		return y;
	} 
	else 
	{
		return y;
	}
}
float grow5()
{

	
	if (y1 <= 5)
	{
		y1 += .6;
		return y1;
	} 
	else 
	{
		return y1;
	}
}
float grow15()
{

	
	if (y2 <= 15)
	{
		y2 += .6;
		return y2;
	} 
	else 
	{
		return y2;
	}
}
float grow20()
{

	
	if (y3 <= 20)
	{
		y3 += .6;
		return y3;
	} 
	else 
	{
		return y3;
	}
}
float grow25()
{

	
	if (y4 <= 25)
	{
		y4 += .6;
		return y4;
	} 
	else 
	{
		return y4;
	}
}