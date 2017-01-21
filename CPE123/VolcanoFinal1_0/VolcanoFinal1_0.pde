import processing.sound.*;
PImage titlePic;
Building[] b = new Building[15];
People[] peoples = new People[30];
SoundFile file;
float Erup;
int[] colorData = new int[12];// 0,1,2 rgb min, 3,4,5 max rgb , 6,7,8 real rgb, 9,10,11 step
PSys fireW1;
DayNight n;
int numStars = 100;
boolean playSound = true;
float[][] stars = new float[numStars][3];
void setup() {
  titlePic = loadImage("title.jpg");
  size(1160, 660);
  noStroke();
  citizens();
  frameRate(120);
  colorMode(RGB, 255, 255, 255, 100);
  fireW1 = new PSys(100, new PVector(width/2, height/1.4));
  float xMod = 0;
  int hMod =0;
  for (int i = 0; i < b.length; i++) {
    xMod = random(40, 90);
    hMod = (int)random(0, 50);
    b[i] = new Building((i*90), xMod, 25+hMod, 5);
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
boolean title = true;
void draw() {
  pushMatrix();
  if(title){
    image(titlePic,0,0);
  }else{
  if (frameCount>=3530 && frameCount<3580) {
    translate(random(10), random(10));
    Erup+=.02;
    if(playSound){
      SoundFile file = new SoundFile(this, "expl.mp3");
      file.play();
      playSound = false;
    }
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
    for(int i = 0; i < b.length; i++){
      for(int j = 0; j < b[i].blocks.length; j++){
        if(b[i].blocks[j].c != color(255)){
          b[i].blocks[j].c = lerpColor(color(175, 115, 75),color(130,130,130,130), (((frameCount - 3530.0)/100)/5));
        }    
      }
    }

    //if (fireW1.dead()) {
      //fireW1 = new PSys(100, new PVector(width/2, height/1.5));
    //}
  }
  if(frameCount >= 3530){
    if(Erup > 0){
      Erup -=.001;
    }
  }
  handlePeople();
  fill(120, 142, 80);
  noStroke();
  rect(-(width-460)/2, 600, width*2, 60);
  }
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
    if (n.moonX >= width/2) {
      step = (int)((n.moonX/(width)-.5)*100);
    }
    if (n.sunX > 0) {
      step = (int)((n.sunX/(width)+.5)*100);
    }
  }else{
    if (n.moonX < width/2) {
      step = (int)((n.moonX/(width)+.5)*100);
    }
    if (n.sunX >= width/2) {
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
void handlePeople(){
  if (frameCount >= 700) {
    for (int i = 0; i < 5; i++) {
      peoples[i].drawPeople();
      peoples[i].updateP();
    }
    if (frameCount >= 1300) {
      for (int i = 5; i < 10; i++) {
        peoples[i].drawPeople();
        peoples[i].updateP();
      }
      if (frameCount >= 1900) {
        for (int i = 10; i < 15; i++) {
          peoples[i].drawPeople();
          peoples[i].updateP();
        }
        if (frameCount >= 2500) {
          for (int i = 15; i < 20; i++) {
            peoples[i].drawPeople();
            peoples[i].updateP();
          }
          if (frameCount >= 3200) {
            for (int i = 20; i < 30; i++) {
              peoples[i].drawPeople();
              peoples[i].updateP();
            }
          }
        }
      }
    }
  }
}
void mouseClicked() {
  title = false;
  print(frameCount);
}