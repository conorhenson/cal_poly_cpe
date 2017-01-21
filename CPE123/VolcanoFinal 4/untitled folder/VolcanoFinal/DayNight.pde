class DayNight {
  float moonX, moonY = 0;
  float sunX, sunY = 0;
  float rectX, rectY = 0;
  void setup() {
    sunX = width;
  }
  void draw() {
    //Call sun once moon is done
    if (moonX >= width-50 && moonX <= width-35) {
      sunX = 0; 
      sunY = 0;
    }
    //Call moon once sun is done
    if (sunX >= width-30 && sunX < width) {
      moonX = 0;
      moonY = 0;
    }
    //Call stars when moon is going
    sun();
    moon();
    if(moonX > width+33){
      moonX = -10000;
      moonY = -10000;
    }
    if(sunX > width+150){
      sunX = -10000;
      sunY = -10000;
    }
  }

  void moon() {
    moonX += 1;
    moonY = -height*sin(moonX/400);
    pushMatrix();
    translate(0, height);
    translate(moonX, moonY);
    fill(255);
    ellipse(0, 0, 65, 65);

    popMatrix();
  }
  void sun() {

    float x1, x2, x3, y1, y2, y3, t;
    sunX += 1;
    sunY = -height*sin(sunX/400);
    pushMatrix();
    translate(0, height);
    translate(sunX, sunY);
    fill(239, 228, 72);
    ellipse(0, 0, 70, 70);
    stroke(1);
    t = 0; 
    for (int i=0; i<26; i++)
    {
      x1 = 0 + 35 * cos(t);
      y1 = 0 + 35 * sin(t);
      x2 = 0 + 80 * cos(t+PI/13);
      y2 = 0 + 80 * sin(t+PI/13);
      x3 = 0 + 35 * cos(t+2*PI/13);
      y3 = 0 + 35 * sin(t+2*PI/13);
      triangle(x1, y1, x2, y2, x3, y3);
      t += PI/13;
    }

    popMatrix();
  }
}