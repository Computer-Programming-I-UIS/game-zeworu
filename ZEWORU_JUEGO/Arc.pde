class Arc extends Obj{ // clase del soldado con arco 
int bx, by, flechas;
  PImage arc,arc2,sangre;
Arc(){
    super(width/2,height/2);
    bx=mouseX;
    by=height-100;
    flechas=8;
    arc=loadImage("arc.png");
    arc2=loadImage("arcUp.png");
    sangre=loadImage("splash.png");
  }
  void update(){// Cuando se mueva el mouse se mueva el personaje
    bx=mouseX+10;
    x=mouseX;
    y=mouseY;
    if(y>height-200)
      by=mouseY+100;
    if(y>height-50)
      reload(FLECHAS);
  }
  void display(){
    tint(200);
    stroke(225);
    noFill();
  
    fire(); 
    imageMode(CENTER);//Cuando se acaben las municiones
    if(y<height/2) image(arc2,bx,by,200,200); 
    else image(arc,bx,by,250,250);
    textSize(30);
    fill(255);
    if(getAmmo()>0){
      text(getAmmoTally()+" "+flechas,x+90,y+11);
    }if(getAmmo()<=0){
      fill(255,100,0);
      textSize(45);
    }
  }
  void fire(){//Funcion que muestra el fuego de las flechas 
    if(mousePressed){
      if(getAmmo()>=0){
        fill(225);
        rectMode(CENTER);
        rect(width/2,height/2,width,height);
        strokeWeight(5);
        stroke(100);
        line(x,y,x,height);
        image(sangre,bx-9,by-95);
      }
    }
    loop();
  }
  void reload(int num){
    flechas=num;
  }
  void incrementAmmo(){
      flechas--;
  }
  int getAmmo(){return flechas;}
  String getAmmoTally(){
    String mo="";
    for(int i=0; i<flechas; i++)
      mo+="*";
    return mo;
  }
}
