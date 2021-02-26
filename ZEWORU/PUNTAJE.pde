class Puntaje
{
  int puntos;
  float tiempo;


  Puntaje()
  {
    puntos = 0;//empieza con un punto
    tiempo = 20; //empieza en tiempo 2
  }

  public void Puntaje_contador()
  {
    textAlign(CENTER);
    text("Puntos:"+puntos, width/2, 40);

    
    for (int i = 0; i < dragonList.size(); i++) // para que todos los dragones mueran
    {
      if (dragonList.get(i).explota_dragon()) 
      {
        puntos ++;
      } 
    }
   
    setTime();
    countDown();
  }

 

  float setTime() //ver el tiempo
  {
    return tiempo;
  }

  void countDown() //contador
  {
    
    tiempo -= 1/frameRate;
    
    text(setTime(), 100, 40);

    if (tiempo <= 0)
    {
      tiempo = 0;

      
      rectMode(CENTER);
      fill(0, 0, 0, 150);
      noStroke();
      rect(width/2, height/2, width, height);

      // Text GAME OVER & Punktestand
      textSize(100);
      textAlign(CENTER);
      fill(255);
      text("GAME OVER", width/2, height/2);
      text("PUNTAJE: "+puntos, width/2, 350);

   
      noLoop();
    }
  }
}
