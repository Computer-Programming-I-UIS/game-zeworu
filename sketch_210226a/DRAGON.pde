class Dragon{
  float x;
  float y;
  float en_X;
  float en_Y;
  boolean explotar;
  
  Dragon(float ax, float ay, float aen_X, float aen_Y){
     x = ax;
    y = ay;
    en_X = aen_X;
    en_Y = aen_Y;
    explotar = false;
  }
  
  void draw_Dragon(){
    image(dragon_image, x, y);
  }
  
  void movimiento_Dragon(){
    x -= en_X;
    y += en_Y;
  }
  
  boolean explota_dragon(){
    if (y+99 > z.y && y+99 < z.y+45 || y-99 > z.y)
    {
        if (x+140 > z.X()+167 && x < z.X()+218)
        {
          explotar = true;
          return true;
        }
    }
    
    return false;
  }
}

  
