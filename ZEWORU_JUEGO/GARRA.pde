class Garra extends Obj{//Clase que muestra las garras cuando no se mata a un dragon
  int tnt;
  PImage img;
  Garra(PImage imag, int x, int y){
    super(x,y);
    tnt=255;
    img=imag;
  }
  void display(){
    tint(tnt);
    image(img,x,y);
  }
  void update(){
    tnt-=5;
    y+=10;
  }
}
