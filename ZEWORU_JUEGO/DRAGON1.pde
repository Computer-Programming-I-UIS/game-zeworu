class Dragon1 extends Obj{// Clase de los dragones que van por abajo 
  float tamano,rapidez;
  PImage dragon1,dragon2,dragon;
  Dragon1(){
    super(int(random(200,width-200)),height-180);
    rapidez=0;
    while(rapidez==0)
      rapidez=random(0.1,1);
    tamano=20;
    dragon1=loadImage("dragon1.png");
    dragon2=loadImage("dragon2.png");
  }
  Dragon1(int nx, int ny){
    super(nx,ny);
    tamano=20;
  }
  
  void update(){
    tamano+=rapidez;
  }
  int getX(){
    return x+x/10-mouseX/20;
  }
  int getY(){
    return y+y/4-mouseY/10;
  }
  float getSize(){return tamano;}// tamaño de los dragones
  void display(){
    tint((int)tamano);
    if(frameCount%20>=0 && frameCount%20<=10)
      image(dragon2,getX(),getY(),tamano,tamano);
    else
      image(dragon1,getX(),getY(),tamano,tamano);
  }
  void sendToBackPosition(){
    tamano=30;
  }
}
