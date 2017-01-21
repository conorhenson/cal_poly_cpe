// Setup (Background)
size(400, 400);
background(#1634F0);
fill(#5F4544);
noStroke();
rect(0, 300, 400, 100);

//Moon 
stroke(0);
fill(255);
ellipse(50,50,75,75);
noStroke();
fill(#1634F0);
ellipse(75,50,75,100);


// Building
fill(#6A6867);
noStroke();
rect(275, 150, 110, 250);
for (int windowy = 150; windowy <= height - 20; windowy += 20) {
  for (int windowx = 280; windowx <= 360; windowx += 20) {
    fill(#F1F211);
    rect (windowx + 5, windowy + 5, 10, 10);
  }
}
fill(#000000);
beginShape();
vertex(275, 150);
vertex(310, 150);
vertex(320, 160);
vertex(310, 170);
vertex(325, 175);
vertex(300, 180);
vertex(305, 195);
vertex(295, 185);
vertex(275, 190);
endShape(CLOSE);

fill(#000000);
beginShape();
vertex(385, 275);
vertex(385, 260);
vertex(370, 265);
vertex(365, 280);
vertex(345, 290);
vertex(355, 300);
vertex(370, 305);
vertex(370, 315);
vertex(385, 310);
endShape(CLOSE);

//Teeth

fill(#F6FCF5);
//Top
triangle(168, 188, 148, 198, 168, 198);
triangle(181, 178, 158, 188, 181, 188);
triangle(193, 168, 167, 178, 193, 178);
triangle(207, 158, 183, 168, 207, 168);

//Bottom
triangle(168, 213, 148, 203, 168, 203);
triangle(181, 223, 158, 213, 181, 213);
triangle(196, 233, 170, 223, 196, 223);
triangle(210, 243, 183, 233, 210, 233);

//Scales
fill(#6D6F6D);
triangle(0, 300, 25, 275, 50, 300);
triangle(10, 275, 35, 250, 60, 275);
triangle(25, 250, 50, 225, 75, 250);
triangle(40, 225, 65, 200, 90, 225);





//Monster Head
fill(#136409);
arc(150, 200, 175, 125, PI/4, 7*PI/4);


//Claws
fill(0);

pushMatrix();
translate(width/2, height/2);
rotate(-PI/4);
arc(-40, 73, 25, 25, PI/4, 7*PI/4);
rotate(PI/3);
arc(58, 148, 25, 25, PI/4, 7*PI/4);
popMatrix();

//Monster Body
pushMatrix();
translate(width/2, height/2);
rotate(PI/10);
fill(#136409);

ellipse(-75, 160, 150, 300);


//Hands
fill(#136409);
rotate(PI/4);
rect(70, 20, 23, 100);
popMatrix();
pushMatrix();
translate(width/2, height/2);

rotate(-PI/3);
rect(-140, -10, 23, 100);
popMatrix();

//Eye
fill(#F6FCF5);
ellipse(145, 165, 25, 15);
fill(0);
ellipse(145, 165, 10, 15);

//Eyebrow
beginShape();
vertex(140, 145);
vertex(130, 160);
vertex(120, 165);
vertex(140, 140);
endShape(CLOSE);

// Red Fire Breath
fill(#ED6C16);
beginShape();
vertex(200, 200);
vertex(275, 175);
vertex(250, 190);
vertex(300, 190);
vertex(270, 200);
vertex(330, 220);
vertex(270, 225);
vertex(305, 250);
endShape(CLOSE);

//Yellow Fire Breath
beginShape();
fill(#E5ED16);
vertex(205, 200);
vertex(245, 190);
vertex(240, 195);
vertex(295, 192);
vertex(268, 198);
vertex(305, 220);
vertex(268, 225);
vertex(290, 240);
endShape(CLOSE);
