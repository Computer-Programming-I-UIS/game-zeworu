PImage img;


void setup(){
  //fullScreen();
  size(1280,720);
  //rameRate(60);
  img = loadImage("bg.png");
}
void draw(){
  
  image(img,0,0);
}
