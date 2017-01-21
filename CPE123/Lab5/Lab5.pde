int end;

void setup() {
	size(400, 400);
	end = 0;		
}

void draw() {
	frameRate(10);
	float t = 0;
	float x,y;
	background(0);

	strokeWeight(1);
	stroke(random(255), random(255), random(255));
	noFill();
	pushMatrix();
	translate(200, 200);
	beginShape();
	for (int i = 0; i < end; ++i) {
		x = (sin(t)*(pow((float) Math.E, cos(t)) - 200 * cos(4*t) - pow(sin((t/12)), 5)));
		y = (cos(t)*(pow((float) Math.E, cos(t)) - 200 * cos(4*t) - pow(sin((t/12)), 5)));
		vertex(x, y);
		t += (2*PI)/30;
	}
	endShape();

	if (end < 35) {
		end += 1;
		
	} else {
		noLoop();
	}
	popMatrix();
} 
