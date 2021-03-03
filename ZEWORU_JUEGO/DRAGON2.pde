class Dragon2 extends Dragon1{//CLase que muestra los dragones que vienen por arriba 
  PImage dragonfly1,dragonfly2;
  Dragon2(){
    super(int(random(200,width-200)),200);
    rapidez=0;
    while(rapidez==0)
      rapidez=random(1,2);
    dragonfly1=loadImage("dragonfly1.png");
    dragonfly2=loadImage("dragonfly2.png");
  }
  void display(){
    tint((int)tamano);
    if(frameCount%20>=0 && frameCount%20<=10)
      image(dragonfly2,getX(),getY(),tamano,tamano);
    else
      image(dragonfly1,getX(),getY(),tamano,tamano);
  }
  void update(){
    if(x<width/2) x++;
    if(x>=width/2) x--;
    tamano+=rapidez;
  }
}
