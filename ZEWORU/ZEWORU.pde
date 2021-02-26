import ddf.minim.*;//Biblioteca audio
 Minim musica;
 AudioPlayer player;
 


PFont fuente;//cargar las imagenes que se van a usar 
PImage img;
PImage history_image;
PImage tutorial_image;
PImage dragon_image;
PImage zero_image;
PImage creditos_image;
PImage clasificacion_image;


String fondo_juego;
int fondo_imagen = 0;

color COLOR_FONDO = color(#A2EAFF); //Declaramos las variables de los colores que se usaran en el programa
color COLOR_BOTONES = color(#88C46B);
color COLOR_FLECHA = color(#56D15F);
color COLOR_TITULO = color(#F51156);

int Settings_titulo_ancho = 200;
int Settings_titulo_altura = 175;

int Tutorial_titulo_ancho = 200;
int Tutorial_titulo_altura = 175;

int [] boton_jugar, boton_salir, boton_salir1, boton_salir2;//variables que se utulizan en el programa

int dragones = 5;

Zero z;
Puntaje p;

ArrayList<Dragon> dragonList=new ArrayList<Dragon>();

void settings(){
  size(1280,680);//tamaño de la pantalla
}


void setup(){
  musica = new Minim(this);
  player = musica.loadFile("musicazeworu.wav");
  player.play();
  img = loadImage("fondo.jpg");
  clasificacion_image = loadImage("clasificacion.png");
  fuente = loadFont("VinetaBT-Regular-50.vlw");//Tipo de letra usada en el programa
  textFont(fuente);
  boton_jugar = new int[4];
  boton_salir = new int[4];
  boton_salir1 = new int[4];
  boton_salir2 = new int[4];
  z = new Zero();
  p = new Puntaje();
  fondo_juego = "MENU";
  
  int x1=0, y1=0;
  
  botones_a();
  
  zero_image = loadImage("zero.png");
  dragon_image = loadImage("dragon.png");
  
  //cargar imagenes del personaje zero y los dragones Nawy
  dragon_image = loadImage("dragon.png");
  zero_image = loadImage("zero.png");
  
  dragonList = new ArrayList<Dragon>();
  
  for(int i=0; i<dragones; i++){
  dragonList.add(new Dragon(random(0,1090), random(-150,0), random(-2,2), random(1,3)));
  }
}


void draw(){

  background(#A2EAFF);
  image(img,0,0);
  image(clasificacion_image,50, 50, 80, 80);
  if(fondo_juego.equals("MENU")){// motrar la palabra menu al momento de abrir el juego 
    
    display_menu();
    
  }else if (fondo_juego.equals("Ajustes")){
    display_Settings();
    
  }else if(fondo_juego.equals("Tutorial")){
    display_tutorial();
  }else if(fondo_juego.equals("Creditos")){
    display_creditos();
  }else if(fondo_juego.equals("Jugar")){
    display_juego();
  }
 
  botones_a();
  
  
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
  text ("Bienvenido a Zeworu!", width/2-400, height /2.5);
  fill(0);
  draw_a("Jugar", boton_jugar[0], boton_jugar[1], boton_jugar[2], boton_jugar[3]);
  draw_a("Salir", boton_salir[0], boton_salir[1], boton_salir[2], boton_salir[3]);


}

void display_Settings(){//funcion que crea los ajustes y lo muestra 
    draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
    draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
    history_image = loadImage("historia.png");
    image(history_image,0,0);
    

}

void display_tutorial(){
      draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
      draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
      tutorial_image = loadImage("tutorial.png");
      image(tutorial_image,0,0);
}

void display_creditos(){
  draw_a("Volver", boton_salir1[0], boton_salir1[1], boton_salir1[2], boton_salir1[3]);
  draw_a("Siguiente", boton_salir2[0], boton_salir2[1], boton_salir2[2], boton_salir2[3]);
  creditos_image = loadImage("creditos.png");
  image(creditos_image,0,0);
}


void display_juego(){
  for (int i = 0; i < dragonList.size(); i++)
  {
    
    dragonList.get(i).draw_Dragon();
    dragonList.get(i).movimiento_Dragon();

    
    if (dragonList.get(i).explota_dragon())
    {
      dragonList.remove(i);
      dragonList.add(new Dragon(random(0, 1090), random(-150, 0), random(-2, 2), random(1, 3)));
    }
  }

  
  z.draw_Zero();
  z.moverse();

  p.Puntaje_contador();

}

void mousePressed(){
  if(fondo_juego.equals("MENU")){
    
    if(mouseX > boton_jugar[0] && mouseX < boton_jugar[2] && mouseY > boton_jugar[1] && mouseY < boton_jugar[3]){
      fondo_juego = "Ajustes";
    }
    if(mouseX > boton_salir[0] && mouseX < boton_salir[2] && mouseY > boton_salir[1] && mouseY < boton_salir[3]){
    exit();
    }
  }else if (fondo_juego.equals("Ajustes")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego = "Tutorial";
    }
  }else if(fondo_juego.equals("Tutorial")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego = "Creditos";
    }
  }else if(fondo_juego.equals("Creditos")){
    
    if(mouseX > boton_salir1[0] && mouseX < boton_salir1[2] && mouseY > boton_salir1[1] && mouseY < boton_salir1[3]){
      fondo_juego = "MENU";
    }
    if(mouseX > boton_salir2[0] && mouseX < boton_salir2[2] && mouseY > boton_salir2[1] && mouseY < boton_salir2[3]){
      fondo_juego = "Jugar";
    }
    
  }
}
