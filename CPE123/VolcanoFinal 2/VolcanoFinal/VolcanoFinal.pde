Building[] b = new Building[15];
float Erup;
int[] colorData = new int[12];// 0,1,2 rgb min, 3,4,5 max rgb , 6,7,8 real rgb, 9,10,11 step
PSys fireW1;
DayNight n;
Flames f;
int numStars = 100;
float[][] stars = new float[numStars][3];
void setup() {
  size(1160, 660);
  noStroke();
  frameRate(120);
  colorMode(RGB, 255, 255, 255, 100);
  fireW1 = new PSys(100, new PVector(width/2, height/1.4));
  float xMod = 0;
  float lastX = 0;
  int hMod =0;
  for (int i = 0; i < b.length; i++) {
    xMod = random(40, 90);
    hMod = (int)random(0, 50);
    b[i] = new Building((i*90), xMod, 25+hMod, 5);
    lastX = xMod;
  }
  colorData[0]= 26;
  colorData[1] = 51;
  colorData[2] = 102;
  colorData[3] = 166;
  colorData[4] = 195;
  colorData[5] = 255;
  colorData[6] = 166;
  colorData[7] = 195;
  colorData[8] = 255;
  colorData[9] =  -(colorData[3]-colorData[0])/100;
  colorData[10] =  -(colorData[4]-colorData[1])/100;
  colorData[11] =  -(colorData[5]-colorData[2])/100;
  n = new DayNight();
  n.setup();
  for(int i = 0; i < numStars; i++){
    float size = random(3,11);
    stars[i][0] = random(-320,800);
    stars[i][1] = random(0,450);
    stars[i][2] = size;
  }
  //f = new Flames(width/2.0, height);
}
void draw() {
  pushMatrix();
  if (frameCount>=3530 && frameCount<3580) {
    translate(random(10), random(10));
    Erup+=.02;
  }
  changeBack(n);
  drawBasePage();
  n.draw();
  if (frameCount <= 800) {
    for (int i = b.length/2 - 2; i < b.length/2 +2; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 800 && frameCount <= 1500) {
    for (int i = b.length/2 - 4; i < b.length/2 +4; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 1500) {
    for (int i = 0; i < b.length; i++) {
      noStroke();
      b[i].draw();
    }
  }
  if (frameCount >= 3530) {
    fireW1.run();  
    if (fireW1.dead()) {
      fireW1 = new PSys(100, new PVector(width/2, height/1.5));
    }
  }
  fill(120, 142, 80);
  noStroke();
  rect(-(width-460)/2, 600, width*2, 60);
  popMatrix();
}
float starBrightness = 100;
void changeBack(DayNight n) {

  int step = 0;
  boolean brighten;
  if ((n.sunX > 0 && n.sunX <= width/2) || n.moonX > width/2) {
    brighten = true;
  } else {
    brighten = false;
  }
  if (brighten) {
    if (n.moonX > width/2) {
      step = (int)((n.moonX/(width)-.5)*100);
    }
    if (n.sunX > 0) {
      step = (int)((n.sunX/(width)+.5)*100);
    }
  }else{
    if (n.moonX < width/2) {
      step = (int)((n.moonX/(width)+.5)*100);
    }
    if (n.sunX > width/2) {
      step = (int)((n.sunX/(width)-.5)*100);
    }
  }
  println(step);
  println(brighten);
  println("moon:  "+n.moonX/width);
  println("sun:  "+n.sunX/width);

  color c;
  if (brighten) {
    c = lerpColor(color(colorData[0], colorData[1], colorData[2]), color(colorData[3], colorData[4], colorData[5]), (step*1.0)/100);
  } else {
    c = lerpColor(color(colorData[3], colorData[4], colorData[5]), color(colorData[0], colorData[1], colorData[2]), (step*1.0)/100);
  }

  colorData[6] = (int)red(c);
  colorData[7] = (int)green(c);
  colorData[8] = (int)blue(c);
  if(brighten){
    starBrightness = 100 - step;
  }else{
    starBrightness = step;
  }
}
void drawBasePage() {
  //draw background
  pushMatrix();
  translate((width-460)/2, 0);
  background(colorData[6], colorData[7], colorData[8]);
  fill(255);
  //ellipse(330, 200, 50, 50);
  fill(#152952);
  //ellipse(320, 200, 40, 50);
  fill(255,starBrightness - 30);
  //ellipse(50, 130, 10, 10);
  //ellipse(310, 230, 7, 7);
  //ellipse(370, 300, 9, 9);
  //ellipse(380, 80, 4, 4);
  //ellipse(200, 80, 4, 4);
  //ellipse(25, 80, 5, 5);
  //ellipse(-100, 70, 3,3);
  //ellipse(-120, 50, 9,9);
  //ellipse(-125, 60, 7,7);
  for(int i = 0; i < numStars; i++){
    ellipse(stars[i][0],stars[i][1],stars[i][2],stars[i][2]);
  }


  pushMatrix();
  scale(.75, .75);
  translate(120, 410);


  pushMatrix();
  translate(200, 200);
  scale(Erup);
  translate(-200, -200);
  noStroke();
  fill(#7A0000);
  int mid = 230;
  ellipse(200, 140, 120, 120);
  ellipse(240, 100, 120, 120);
  ellipse(160, 100, 120, 120);
  ellipse(200, 70, 120, 120);
  ellipse(200, 10, 220, 120);
  ellipse(110, 60, 120, 120);
  ellipse(290, 60, 120, 120);
  ellipse(290, -10, 220, 220);
  ellipse(200, -10, 220, 220);
  ellipse(180, -25, 220, 220);


  //lava
  fill(#FF0000);
  triangle(150, 220, 155, 50, 190, 220);
  triangle(170, 220, 195, 50, 220, 220);
  triangle(190, 220, 235, 50, 240, 220);
  fill(#FF3300);
  triangle(150, 220, 130, 40, 200, 220);
  triangle(180, 220, 160, 40, 230, 220);
  triangle(180, 220, 220, 40, 240, 220);
  triangle(210, 220, 260, 40, 250, 220);
  //yellow lava
  fill(#E6E600);
  ellipse(100, 40, 15, 15);

  arc(120, 75, 15, 60, PI/.8, 4+PI);
  arc(160, 65, 10, 60, PI/.8, 4+PI);
  arc(230, 84, 7, 60, PI/.8, 4+PI);


  triangle(180, 220, 150, 90, 230, 220);
  triangle(180, 220, 220, 90, 230, 220);
  triangle(180, 220, 260, 90, 230, 220);

  popMatrix();


  //volcanoe
  //460
  fill(#331A00);
  quad(140, 200, 260, 200, 380, 380, 20, 380);
  noStroke();
  quad(0, 380, 0, 400, 400, 400, 400, 380);


  //lava stream
  fill(#CCCC00);
  rotate(PI/4);
  translate(45, -178);
  ellipse(225, 220, 20, 60);
  rotate(-PI/6);
  ellipse(145, 290, 20, 50);
  ellipse(76, 340, 20, 50);
  rotate(PI/4);
  ellipse(310, 210, 10, 35);
  rotate(-PI/2);
  ellipse(-115, 340, 20, 50);

  popMatrix();

  //draw grass
  //  fill(120, 142, 80);
  //  rect(-(width-460)/2, 600, width, 60);
  popMatrix();
}
void mouseClicked() {
  print(frameCount);
}