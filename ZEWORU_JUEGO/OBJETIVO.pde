class Obj{
  int x,y;
   Obj(int x, int y){
    this.x=x;
    this.y=y;
  }
  int getX(){return x;}
  int getY(){return y;}
  void update(){}
  void display(){}
  double mover(Obj other){
    return(Math.sqrt((other.getX()-x)*(other.getX()-x)+(other.getY()-y)*(other.getY()-y)));
  }
  void setCenter(){
    x=width/2;
    y=height/2;
  }
}
