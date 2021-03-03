import ddf.minim.*; //Biblioteca audio
 Minim musica;
 AudioPlayer player;

PFont fuente;//cargar las imagenes que se van a usar 


//Objects
ArrayList<Obj> dragones1, garras, dragones2; //Almacenar las clases y los objetos creado 
ArrayList<Integer> puntos;
ArrayList<ArrayList<Obj>> allObjects;
Arc arc;

//Variables del jeugo
int punto,tiempo,juego_fondo,vidas;
int FLECHAS=8, CANT_DRAGONES1=3, CANT_DRAGONES2=2;

//Images del juego
PImage fondo_juego,garra;
PImage creditos_image;
PImage clasificacion_image;
PImage history_image;
PImage tutorial_image;
PImage img;
PImage game_over;
PImage zeworu_image;

String fondo_juego1;
int fondo_imagen = 0;

color COLOR_FLECHA = color(#56D15F);

int [] boton_jugar, boton_salir, boton_salir1, boton_salir2;//variables que se utilizan en el programa

void settings(){
  size(1280,680);//tamaño de la pantalla
}

void setup(){
  musica = new Minim(this);
  player = musica.loadFile("musicazeworu.wav");//Cargar musica de fondo.
  player.play();
  img = loadImage("fondo.jpg");
  clasificacion_image = loadImage("E.png");
  frameRate(50);
  fuente = loadFont("VinetaBT-Regular-50.vlw");//Tipo de letra usada en el programa//
  textFont(fuente);
  
  boton_jugar = new int[4];//Inicializar botones
  boton_salir = new int[4];
  boton_salir1 = new int[4];
  boton_salir2 = new int[4];
  
  fondo_juego1 = "MENU";
  
  int x1=0, y1=0;
  
  botones_a();
  
  dragones1 = new ArrayList<Obj>();//Mostrar las variables asignadas 
  garras = new ArrayList<Obj>();
  dragones2 = new ArrayList<Obj>();
  puntos = new ArrayList<Integer>();
  while(dragones1.size()<CANT_DRAGONES1){
      dragones1.add(new Dragon1());
  }
  while(dragones2.size()<CANT_DRAGONES2){// Para que salgan la cantidad de dragones
      dragones2.add(new Dragon2());
  }
  allObjects = new ArrayList<ArrayList<Obj>>();
  allObjects.add(dragones1);
  allObjects.add(dragones2);
  allObjects.add(garras);
  puntos.add(0);
  fondo_juego = loadImage("fondo.jpg");
  garra = loadImage("garra.png");
  vidas = 5;
  arc = new Arc();
  juego_fondo=0;
}

String MaxPunto(){//Conteo del puntaje en pantalla
  int MaxPunto=puntos.get(0);
  for(int i=1;i<puntos.size();i++)
    if(puntos.get(i)>MaxPunto) MaxPunto=puntos.get(i);
  if(MaxPunto==0) return "+";
  return ""+MaxPunto;
}


String getLivesTally(){ //Conteo de vidas en pantalla
  String mo="";
  for(int i=0; i<vidas; i++)
    mo+="*";
  return mo;
}

 


void draw(){
  background(#A2EAFF);
  image(img,0,0);
  
   if(fondo_juego1.equals("MENU")){// motrar la palabra menu al momento de abrir el juego 
    
    display_menu();
    
  }else if (fondo_juego1.equals("Ajustes")){
    display_Settings();
    
  }else if(fondo_juego1.equals("Tutorial")){
    display_tutorial();
  }else if(fondo_juego1.equals("Creditos")){
    display_creditos();
  }else if(fondo_juego1.equals("Jugar")){
    display_juego();
  }
 
  botones_a();
 
  
  
  
 
  if(juego_fondo==3) endScreen();
  if(juego_fondo==4) display_juego();
  for(int i=0;i<dragones1.size();i++){
    if(((Dragon1)dragones1.get(i)).getSize()>255){
       garras.add(new Garra(garra,dragones1.get(i).getX(),dragones1.get(i).getY()));//Cuando no se mate, salga la imagen de una garra en pantalla
       dragones1.remove(i);
       dragones1.add(new Dragon1());
       vidas--;
    }
  }
  for(int i=0;i<dragones2.size();i++){
    if(((Dragon1)dragones2.get(i)).getSize()>255){
       garras.add(new Garra(garra,dragones2.get(i).getX(),dragones2.get(i).getY()));
       dragones2.remove(i);
       dragones2.add(new Dragon2());
       vidas--;
    }
  }
}


void botones_a(){ //declaramos la posicion de los botones de star y de exit como tambien los botones de regresar al menu 
  boton_jugar[0] = 250;
  boton_jugar[1] = 400;
  boton_jugar[2] = 500;
  boton_jugar[3] = 500;
  
  boton_salir[0] = 600;
  boton_salir[1] = 400;
  boton_salir[2] = 870;
  boton_salir[3] = 500;
  
  boton_salir1[0] = 50;
  boton_salir1[1] = 40;
  boton_salir1[2] = 300;
  boton_salir1[3] = 120;
  
  boton_salir2[0] = 550;
  boton_salir2[1] = 40;
  boton_salir2[2] = 900;
  boton_salir2[3] = 120;
  
  
  
  
}

void draw_a(String texto, int x1, int y1, int x2, int y2){//funcion que crea los botones 
  int boton_1 = 50;
  textSize(40);
  
  stroke(#88C46B);
  strokeWeight(4);
  fill(#88C46B);
  
  rect(x1, y1, x2 - x1, y2 -y1, boton_1);
  
  fill(0);
  
  text(texto, 25 + x1, 30 + y1 + ((y2 - y1)/2));
  
  fill(#55197C);
  
  text(texto, 25 + x1, 30 + y1 + ((y2 - y1)/2));
  
  
  
}

void display_menu(){//funcion que crea el menu y lo muestra
  fill(#897C79);
  textSize(50);
  image(clasificacion_image,50, 50, 80, 80);
  zeworu_image = loadImage("nombre.png");
  image(zeworu_image,100,100);
  fill(0);
  draw_a("Jugar", boton_jugar[0], boton_jugar[1], boton_jugar[2], boton_jugar[3]);
  draw_a("Salir", boton_salir[0], boton_salir[1], boton_salir[2], boton_salir[3]);
  if(arc.getAmmo()>=0 && juego_fondo==0){
      juego_fondo=1;
      arc.reload(FLECHAS);
      frameCount=0;
      punto=0;
      vidas=5;
      for(Obj d : dragones1){
        ((Dragon1)d).sendToBackPosition();
      }

    }

  }



void display_Settings(){//funcion que crea los ajustes y lo muestra 
    draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
    draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
    history_image = loadImage("historia.png");
    image(history_image,0,0);
    

}

void display_tutorial(){//funcion que crea el tutorial y lo muestra 
      draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
      draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
      tutorial_image = loadImage("tutorial.png");
      image(tutorial_image,0,0);
}

void display_creditos(){//funcion que crea los creditos y lo muestra 
  draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
  draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
  creditos_image = loadImage("creditos.png");
  image(creditos_image,0,0);
}

void display_juego(){//funcion que crea el juego y lo muestra 
  background(0);
  tint(255);
  image(fondo_juego,width/2,height/2);
  
  //objetos
  arc.update();
  for(ArrayList<Obj> list : allObjects){
    for(Obj obj : list){
      obj.update();
      obj.display();
    } 
  }
  arc.display();
  
  //Mostrar las muertes en pantalla
  textSize(20);
  fill(255);
  text("RIP Newy",100,110);
  textSize(20);
  fill(#4CC144);
  text(punto,150,85);
  
  //Mostras las vidas en pantalla
  textSize(20);
  fill(255);
  text("VIDAS Zero",1000,110);
  textSize(20);
  fill(#4CC144);
  text(vidas+" "+getLivesTally(),1050,85);
  
  //Mostrar el tiempo en pantalla
  fill(255);  
  textSize(40);
  text((int)tiempo,width/2,50);
  tiempo=(int)frameCount/60;
  if(vidas<=0) juego_fondo=3;
}

void endScreen(){ //Cuando se pierde salga game over.
  image(fondo_juego,width/2,height/2);
  fill(255,0,0);
  textSize(100);
  game_over = loadImage("gameover.png");
  image(game_over,650,300,900,150);
 
}


void mousePressed(){//Al presionar click se haga lo correspondiente
  arc.incrementAmmo();
  if(arc.getAmmo()>=0){
    for(int i=0;i<dragones1.size();i++){
      Dragon1 d = ((Dragon1)dragones1.get(i));
      double mover = (Math.sqrt((d.getX()-mouseX)*(d.getX()-mouseX)+(d.getY()-mouseY)*(d.getY()-mouseY)));
      
      if(mover<=d.getSize()/2 && juego_fondo==1){      
        fill(255);
        punto++;
        dragones1.remove(i);
        dragones1.add(new Dragon1());
        i--;  
      } 
    }
    for(int i=0;i<dragones2.size();i++){
      Dragon1 d = ((Dragon1)dragones2.get(i));
      double mover = (Math.sqrt((d.getX()-mouseX)*(d.getX()-mouseX)+(d.getY()-mouseY)*(d.getY()-mouseY)));
      
      if(mover<=d.getSize()/2 && juego_fondo==1){      
        fill(255);
        punto++;
        dragones2.remove(i);
        dragones2.add(new Dragon2());
        i--;  
      } 
    }
  }
  
  if(fondo_juego1.equals("MENU")){
    
    if(mouseX > boton_jugar[0] && mouseX < boton_jugar[2] && mouseY > boton_jugar[1] && mouseY < boton_jugar[3]){
      fondo_juego1 = "Ajustes";
    }
    if(mouseX > boton_salir[0] && mouseX < boton_salir[2] && mouseY > boton_salir[1] && mouseY < boton_salir[3]){
    exit();
    }
  }else if (fondo_juego1.equals("Ajustes")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego1 = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego1 = "Tutorial";
    }
  }else if(fondo_juego1.equals("Tutorial")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego1 = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego1 = "Creditos";
    }
  }else if(fondo_juego1.equals("Creditos")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego1 = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego1 = "Jugar";
    }
    
  }
}


void keyPressed(){
  if(keyCode=='R'){
    arc.reload(FLECHAS);
    juego_fondo=0;
  }
  if(keyCode==LEFT) juego_fondo--;
}
