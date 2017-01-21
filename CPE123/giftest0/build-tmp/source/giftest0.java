import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gifAnimation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class giftest0 extends PApplet {

    // import the gifAnimation library

Gif myAnimation;          // create Gif object called myAnimation

public void setup() {
  
  size(800,800);          // window size (pixels), use(displayWidth, 
                          // displayHeight)for fullscreen size
  
  myAnimation = new Gif(this, "animated-fire-image-0379_1.gif"); // load animated GIF file from 
                                            // the data folder, replace 
                                            // "img01.gif" with the name of 
                                            // your GIF file
  
  myAnimation.play();                       // play the animated GIF
  
}


public void draw() {
 
 background(255);             // window background color, 255 = white, 0 = 
                               // black, RGB values e.g. (43,170,224)
 
 image(myAnimation,100,100);   // display the animated GIF, define top left 
                               // corner x and y coordinates for the animation  

 }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "giftest0" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
