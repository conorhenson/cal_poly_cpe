import gifAnimation.*;    // import the gifAnimation library

Gif myAnimation;          // create Gif object called myAnimation

void setup() {
  
  size(800,800);          // window size (pixels), use(displayWidth, 
                          // displayHeight)for fullscreen size
  
  myAnimation = new Gif(this, "animated-fire-image-0379_1.gif"); // load animated GIF file from 
                                            // the data folder, replace 
                                            // "img01.gif" with the name of 
                                            // your GIF file
  
  myAnimation.play();                       // play the animated GIF
  
}


void draw() {
 
 background(255);             // window background color, 255 = white, 0 = 
                               // black, RGB values e.g. (43,170,224)
 
 image(myAnimation,100,100);   // display the animated GIF, define top left 
                               // corner x and y coordinates for the animation  

 }
