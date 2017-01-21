//CSC 123 Lab 11 - One point perspective exercize and class practice.
//This code currently draws a road and five very simple cars that drive down the raod
//TODO: **create a new class called 'airplane' or 'saucer' that draws a flying ship that also heads off
//      into the distance  - you can even draw a little city or dome or destination if desired***
//TODO: change the code so that the cars look better
//TODO: change the code so that the cars do not run over one another (you may use a 'hack', ie have them
//      start at different times or a more complex method

class car {
  PVector loc, stop, begin;
  PVector dir;
  float speed;
  float dist;
  color c;
  boolean alive;
  int go, time;
  
  car(PVector start, PVector end, int order) {
    begin = start.get();
    loc = start.get();
    stop = end.get();
    end.sub(start);
    dir = end.get();
    dist = dir.mag();
    dir.normalize();

    speed = random(1.5, 1.7);
    c = color(random(20, 240), random(10, 240), random(10, 240));
    alive = true;
    time = 0;
    go = order;
  }
  
  void draw() {
    float more;
    PVector temp;
    
    temp = new PVector(stop.x, stop.y);
    temp.sub(loc);
    more = temp.mag();

    if (alive && time >= go) {
      fill(c);
      pushMatrix();
        stroke(c);
        strokeJoin(ROUND);
        strokeWeight(4);
        translate(loc.x, loc.y);
        scale( (more/dist)*1.6 );
        rect(0, 0, 40, 20); //car body
        rect(10, -10, 20, 10); //car top
        fill(250, 250, 250, 250);
        rect(12, -8, 16, 6); //window
        noStroke();
        fill(190);
        ellipse(10, 20, 8, 12);
        ellipse(30, 20, 8, 12);
      popMatrix();
    }
    time++;
  }
  
  void drive() {
    float traveled;
    PVector temp;
    
    if (time >= go) {
      temp = new PVector(begin.x, begin.y);
      temp.sub(loc);
      traveled = temp.mag();
      if (traveled < dist) {
        loc.x += dir.x*speed;
        loc.y += dir.y*speed;
      } else {
        alive = false;
      }
    }  
  }
    
}


class ship {
  PVector loc, stop, begin;
  PVector dir;
  float speed;
  float dist;
  color c;
  boolean alive;
  
 ship(PVector start, PVector end) {
    begin = start.get();
    loc = start.get();
    stop = end.get();
    end.sub(start);
    dir = end.get();
    dist = dir.mag();
    dir.normalize();

    speed = random(1, 2);
    c = color(random(20, 240), random(10, 240), random(10, 240));
    alive = true;
  }
  
  void draw() {
    float more;
    PVector temp;
    
    temp = new PVector(stop.x, stop.y);
    temp.sub(loc);
    more = temp.mag();
    strokeWeight(1);
    if (alive) {
      stroke(0);
      pushMatrix();
        translate(loc.x, loc.y);
        scale( (more/dist)*1.6 );
        fill(255);
        ellipse(0, -10, 20, 20);
        fill(c);
        ellipse(0, 0, 40, 20);
      popMatrix();
    }
  }
  
  void fly() {
    float traveled;
    PVector temp;
    
    temp = new PVector(begin.x, begin.y);
    temp.sub(loc);
    traveled = temp.mag();
    if (traveled < dist) {
      loc.x += dir.x*speed;
      loc.y += dir.y*speed;
    } else {
      alive = false;
    }
  }    
}

ship theShips[];
car theCars[];
int numC, numS;

void setup() {
  
  size(400, 400);
  smooth();
  numC = 5;
  numS = 4;
  
  theCars = new car[numC];
  theShips = new ship[numS];
  
  for (int i=0; i < numC; i++) {
    theCars[i] = new car(new PVector(-20, height+20), new PVector(width*.8, height/2), i*40+ (int)random(5, 20));
  }
  
  for (int i=0; i < numS; i++) {
    theShips[i] = new ship(new PVector(random(0, width), random(-10, 0)), new PVector(width*.8, height/2));
  }
}

void draw() {
 background(175, 221, 245);
 //draw the city dome
 stroke(255);
 fill(143, 211, 134, 128);
 ellipse(width*.8, height/2, 40, 20);
 
 //draw forground
 noStroke();
 fill(147, 107, 70);
 rect(0, height/2,  width, height/2);
 //draw road
 stroke(255);
 fill(0);
 triangle(width*.8, height/2, width*.2, height+20, -.2*width, height+20);
 
 for (int i=0; i < numC; i++) {
   theCars[i].draw();
   theCars[i].drive();
 }  
 
 for (int i=0; i < numS; i++) {
   theShips[i].draw();
   theShips[i].fly();
 } 
}

void mousePressed() {
  PVector end;
  
  end = new PVector(.8*width, height/2);
  //reset all the cars
   for (int i=0; i < numC; i++) {
     theCars[i].loc.x = -20;
     theCars[i].loc.y = height+20;
     theCars[i].alive = true;
     theCars[i].time = 0;
   }
   
   for (int i=0; i < numS; i++) {
     end.x = .8*width;
     end.y = height/2;
     theShips[i].begin.x = theShips[i].loc.x = random(0, width);
     theShips[i].begin.y =theShips[i].loc.y = random(-10, 0);
     theShips[i].alive = true;
     end.sub(theShips[i].loc);
     theShips[i].dir = end.get();
     theShips[i].dist = theShips[i].dir.mag();
     theShips[i].dir.normalize();
   }
}
