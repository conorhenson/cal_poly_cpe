PImage[] pics = new PImage[4];
PImage[] outPics = new PImage[4];
color[] colors = new color[100];
int loc, j;
int f = 4;
color pix1;

void setup() {
   size(630, 600);
   background(0);
   for( int i = 0; i < 100; i ++){
     colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
   }
   
    for( int i = 0; i < 4; i ++){   
    pics[i]= loadImage("lab8pic.jpg");
    pics[i].resize(width/2, height/2);
    outPics[i] = createImage(pics[i].width, pics[i].height, RGB);
    pics[i].loadPixels();
    outPics[i].loadPixels();
     
    for (int y = 1; y < pics[i].height-1; y++) {
      for (int x = 1; x < pics[i].width-1; x++) {
         //translate 2D image location to a 1D array location
         loc = x + y*pics[i].width;
         pix1 = pics[i].pixels[loc];
         if (green(pics[i].pixels[loc]) < 210) {
            outPics[i].pixels[loc] = pics[i].pixels[loc];
            //hair
   
            if(imp_ellipse(pics[i].width/2, pics[i].height/2, pics[i].width*.66, pics[i].height*.8, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 90 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+43];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+23];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+10];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+67];
              }
            }
            //face
            if(imp_ellipse(pics[i].width/2, pics[i].height*(2/3), pics[i].width/4, pics[i].height*.75, x, y) >= 0){
              if(blue(pics[i].pixels[loc]) > 100){
               if(i == 0)
               outPics[i].pixels[loc] = colors[i+4];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+4];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+5];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+6];
              }
            }
            //left eye 
            if(imp_ellipse(pics[i].width/2, pics[i].height*.42, pics[i].width/10, pics[i].height/10, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 100 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+50];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+41];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+31];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+21];
              }
            }
            //right eye
            if(imp_ellipse(pics[i].width*.38, pics[i].height*.47, pics[i].width/15, pics[i].height/15, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 100 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+50];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+41];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+31];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+21];
              }
            }
            //mouth
            if(imp_ellipse(pics[i].width*.46, pics[i].height*.64, pics[i].width/8, pics[i].height/15, x, y) <= 0){
              if(green(pics[i].pixels[loc]) <= 110){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+45];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+32];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+78];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+93];
              }
           }
            //spot that didnt work (this is a fix)
            if(imp_ellipse(pics[i].width*.50, pics[i].height*.30, pics[i].width/6, pics[i].height/6, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) > 100){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+4];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+4];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+5];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+6];
              }}
         }
            
         
         //backgrounds
         else{
              outPics[i].pixels[loc] = colors[i];
            }     
         }
      }
   }

    }


void draw() {
  //draws first 4 images
  if (f == 4){
       image(outPics[0], 0, 0);
       image(outPics[1], 0, height/2);
       image(outPics[2], width/2, 0);
       image(outPics[3], width/2, height/2);
  } else if( f <= 3){
    //draws new imaged based on value from mouse pressed
    picture(f);
    image(outPics[0], 0, 0);
       image(outPics[1], 0, height/2);
       image(outPics[2], width/2, 0);
       image(outPics[3], width/2, height/2);
       f = 4;
  }
}
//implict ellipse function (modifed example)
float imp_ellipse(float cx, float cy, float w, float h, float x, float y)
{
   return ((cx-x)*(cx-x))/((w/2)*(w/2)) + ((cy-y)*(cy-y))/((h/2)*(h/2)) - 1;
}
//What we pass f into to make new image (code is almost the same as setup)
void picture(int i){  
    pics[i]= loadImage("lab8pic.jpg");
    pics[i].resize(width/2, height/2);
    outPics[i] = createImage(pics[i].width, pics[i].height, RGB);
    pics[i].loadPixels();
    outPics[i].loadPixels();
    //dont call for loop cause making one image and generate a new array of random colors
    for( int z = 0; z < 100; z ++){
     colors[z] = color(random(0, 255), random(0, 255), random(0, 255));
   }
    for (int y = 1; y < pics[i].height-1; y++) {
      for (int x = 1; x < pics[i].width-1; x++) {
         //translate 2D image location to a 1D array location
         loc = x + y*pics[i].width;
         pix1 = pics[i].pixels[loc];
         if (green(pics[i].pixels[loc]) < 210) {
            outPics[i].pixels[loc] = pics[i].pixels[loc];
            //hair
   
            if(imp_ellipse(pics[i].width/2, pics[i].height/2, pics[i].width*.66, pics[i].height*.8, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 90 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+43];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+23];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+10];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+67];
              }
            }
            //face
            if(imp_ellipse(pics[i].width/2, pics[i].height*(2/3), pics[i].width/4, pics[i].height*.75, x, y) >= 0){
              if(blue(pics[i].pixels[loc]) > 100){
               if(i == 0)
               outPics[i].pixels[loc] = colors[i+4];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+4];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+5];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+6];
              }
            }
            if(imp_ellipse(pics[i].width/2, pics[i].height*.42, pics[i].width/10, pics[i].height/10, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 100 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+50];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+41];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+31];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+21];
              }
            }
            if(imp_ellipse(pics[i].width*.38, pics[i].height*.47, pics[i].width/15, pics[i].height/15, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) <= 100 ){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+50];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+41];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+31];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+21];
              }
            }
            if(imp_ellipse(pics[i].width*.46, pics[i].height*.64, pics[i].width/8, pics[i].height/15, x, y) <= 0){
              if(green(pics[i].pixels[loc]) <= 110){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+45];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+32];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+78];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+93];
              }
            }
            if(imp_ellipse(pics[i].width*.50, pics[i].height*.30, pics[i].width/6, pics[i].height/6, x, y) <= 0){
              if(blue(pics[i].pixels[loc]) > 100){
                if(i == 0)
               outPics[i].pixels[loc] = colors[i+4];
                if(i == 1)
                outPics[i].pixels[loc] = colors[i+4];
                if(i == 2)
                outPics[i].pixels[loc] = colors[i+5];
                if(i == 3)
                 outPics[i].pixels[loc] = colors[i+6];
              }}
         }
            
         
         //backgrounds
         else{
              outPics[i].pixels[loc] = colors[i];
            }     
         }
      }
}
//Where mouse is pressed and what title to change
void mousePressed(){
  if (mouseX < width/2 && mouseY < height/2){
    f = 0;
  }
  else if (mouseX > width/2 && mouseY < height/2){
    f = 2;
  }
  else if (mouseX < width/2 && mouseY > height/2){
    f = 1;
  }
  else if (mouseX > width/2 && mouseY > height/2){
    f = 3;
  }
}
