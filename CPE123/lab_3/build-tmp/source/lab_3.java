import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class lab_3 extends PApplet {

float moonX, moonY = 0;
float sunX, sunY = 0;
float cloudX = -500;
float rectX, rectY = 0;
boolean face, sunGlass;
PImage moon;
float x = 0;
public void setup(){
  
  face = false;
  sunGlass = false;
  sunX = 400;
}
public void draw(){
  back();
  //Call sun once moon is done
  if (moonX >= 350 && moonX <= 365){
    sunX = 0; 
    sunY = 0;
    cloudX = 400;
    x = 0;
    face = false;
    sunGlass = false;
  }
  //Call moon once sun is done
  if (sunX >= 370 && sunX <= 399){
    moonX = 0;
    moonY = 0;
    face = false;
    sunGlass = false;
    
  }
  //Call stars when moon is going
  if (moonX <= 350  && moonX >= 45){
  star();
  }
  sun();
  clouds();
  moon();
  hills();
}

public void moon(){
  moonX += .3f;
  moonY = -300*sin(moonX/125);
  pushMatrix();
  translate(0, 400);
  translate(moonX, moonY);
  fill(255);
  ellipse(0, 0, 65, 65);
  if (face){
    moonFace();
  }
  
  popMatrix();
  
}
public void star(){
  rectX = random(400);
  rectY = random(250);
  fill(242, 204, 0);
  rect(rectX,rectY, 5, 5);
  rectX = random(400);
  rectY = random(250);
  rect(rectX,rectY, 7, 7);
  
}
public void mousePressed(){
  if (moonX <= 400) {
    if (mouseY >= 240 && face == true) {
      face = false;
    } else if (mouseY >= 240 && face == false){
    face = true;
    }
  } else if (sunX < 400){
    if (mouseY >= 240 && sunGlass == true) {
      sunGlass = false;
    } else if (mouseY >= 240 && sunGlass == false){
    sunGlass = true;
    }
}
}
//Makes the hills in background
public void hills() {
  fill(50);
  beginShape();
  vertex(0, 300);
  bezierVertex(50, 250, 100, 250, 150, 300);
  bezierVertex(200, 250, 250, 250, 300, 300);
  bezierVertex(350, 250, 400, 250, 450, 300);
  vertex(400, 400);
  vertex(0, 400);
  endShape(CLOSE);

}
public void sun(){
  
  float x1, x2, x3, y1, y2, y3, t;
  sunX += .3f;
  sunY = -300*sin(sunX/125);
  pushMatrix();
  translate(0, 400);
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
  
  if(sunGlass){
    glasses();
  }
  popMatrix();
}
public void back(){
  
  if (moonX <= 365){
    background(18, 23, 92);
  }
  if (sunX <= 380){
    while (x <= 100){
    x += .1f;
    background(18 + x, 50 + x, 130 + x );
    }
    background(18 + x, 50 + x, 130 + x );
  }
}
//The face for the sun
public void glasses(){
  beginShape();
  fill(0);
  vertex(-24, -25);
  vertex(-5, -25);
  vertex(-5, -20);
  vertex(-0, -20);
  vertex(-0, -25);
  vertex(25, -25);
  vertex(22, -10);
  vertex(2, -10);
  vertex(0, -15);
  vertex(-5, -15);
  vertex(-7, -10);
  vertex(-23, -10);
  endShape(CLOSE);
  fill(0);
  beginShape();
  curveVertex(-23, 5);
  curveVertex(-23, 5);
  curveVertex(-5, 15);
  curveVertex(5, 15);
  curveVertex(20, 5);
  curveVertex(20, 5);
  endShape(CLOSE);
}
public void clouds(){
pushMatrix();
  translate(cloudX, 0);
  fill(255);
 beginShape();
vertex(20, 20);
bezierVertex(40, 10, 50, 10, 60, 20);
bezierVertex(70, 10, 80, 10, 90, 20);
bezierVertex(100, 10, 110, 10, 120, 20);
bezierVertex(130, 30, 130, 30, 120, 40);
bezierVertex(110, 50, 100, 50, 90, 40);
bezierVertex(80, 50, 70, 50, 60, 40);
bezierVertex(50, 50, 40, 50, 30, 40);
endShape(CLOSE);
popMatrix();
pushMatrix();
translate(cloudX + 200, 50);
 
  fill(255);
 beginShape();
vertex(20, 20);
bezierVertex(40, 10, 50, 10, 60, 20);
bezierVertex(70, 10, 80, 10, 90, 20);
bezierVertex(100, 10, 110, 10, 120, 20);
bezierVertex(130, 30, 130, 30, 120, 40);
bezierVertex(110, 50, 100, 50, 90, 40);
bezierVertex(80, 50, 70, 50, 60, 40);
bezierVertex(50, 50, 40, 50, 30, 40);
endShape(CLOSE);
popMatrix();
pushMatrix();
translate(cloudX + 35, 70);
 
  fill(255);
 beginShape();
vertex(20, 20);
bezierVertex(40, 10, 50, 10, 60, 20);
bezierVertex(70, 10, 80, 10, 90, 20);
bezierVertex(100, 10, 110, 10, 120, 20);
bezierVertex(130, 30, 130, 30, 120, 40);
bezierVertex(110, 50, 100, 50, 90, 40);
bezierVertex(80, 50, 70, 50, 60, 40);
bezierVertex(50, 50, 40, 50, 30, 40);
endShape(CLOSE);
popMatrix();
cloudX -= .5f;
}
//Makes the moon's face
public void moonFace(){
  pushMatrix();
  stroke(1);
  fill(255);
  ellipse(-12, -12, 12, 9);
  ellipse(12, -12, 12, 9);
  fill(0);
  ellipse(-12, -12, 5, 9);
  ellipse(12, -12, 5, 9);
  pushMatrix();
  beginShape();
  curveVertex(-23, 5);
  curveVertex(-23, 5);
  curveVertex(0, 15);
  curveVertex(20, 5);
  curveVertex(20, 5);
  endShape(CLOSE);
  popMatrix();
  popMatrix();
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lab_3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
