class Zero{
  float a;
  float x;
  float y;
  float en_X;
  float en_Y;
  float gravedad;
  
  Zero(){
    a = 342;
    x = 200;
    y = height - a;
    en_X = 10;
    en_Y = 0;
    gravedad = 2;
  }
  
  void draw_Zero(){
   image(zero_image,x,y);
  }
  
  void moverse(){
   moverse_zero();
  }
  
  void moverse_zero(){
    if(keyPressed){
      if(key == CODED){
        if(keyCode == RIGHT){
          x += en_X;
        }else if(key == CODED){
          if(keyCode == LEFT){
            x -= en_X;
          }
        }
      }
    }
  }
  
  float Y(){
    return y;
  }
  
  float X(){
    return x;
  }
}
  
