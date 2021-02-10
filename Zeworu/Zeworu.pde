PImage img;
final int stateGame=0;
final int stateMenu = 1;
final int stateSplashScreen = 2;
final int stateHelp = 3;
int state = stateSplashScreen;
int playerNumber = 0; 
//
// ---------------------------------------------------------------
void setup(){
  //Pantalla Completa();
  size(1280,680);
  // Fondo
  img = loadImage("bg.png");
}
void draw(){
  
  image(img,0,0);
  
  textSize(22);
 
  // 
  switch(state) {
  case stateGame:
    drawForStateGame();
    break;
  case stateSplashScreen:
    // Se muestra pantalla de inicio
    drawForStateSplashScreen();
    break; 
  case stateHelp:
    drawForStateHelp();
    break;  
  case stateMenu:
    drawForStateMenu();
    break; 
  default:
    // error 
    break;
  } 
  
}  
 
// ------------------------------------------
// 
 
void drawForStateGame() {
  text("Game...", 200, 200);
  text(playerNumber 
    + " Players. Hit F1 for help. Hit r to restart.", 
  200, height-20);
  for (int i = 1; i < 10 * playerNumber; i++) 
    signHome(0 + i*20, 100);
}
 
void drawForStateSplashScreen() {
  // 
  // Cuadro de bienvenida
  noStroke();
  fill(0, 50);  // Cuadro Transparente
  rect (100, 100, width-200, height-200, 15, 15, 15, 15);
  // Textos 
  fill(255, 0, 0); // red 
  textSize(48);
  text ("Welcome to Zeworu!", width/2-100, height /2);
  fill(0);
  textSize(22);
  text ("To go to the menu, press f1", width/2-10, height /2+60);
 
}
 
void drawForStateHelp() {
  text("the help...", 200, 100);
}
 
void drawForStateMenu() {
  text("MENU", 200, 100);
  text("   1. Play with 2 players ", 200, 150);
  text("   2. Play with 4 players ", 200, 200);
  text("hit 1 or 2  ", 200, 250);
}
 
// ---------------------------------------------------
 
void keyPressed() {
  
  switch(state) {
  case stateGame:
    //     
    if (keyCode==java.awt.event.KeyEvent.VK_F1) {
      // F1
      state =  stateHelp;
    } // if 
    else if (key == 'r') {
      state = stateSplashScreen;
    }
    else {
      //
    }
    break;
  case stateSplashScreen:
     
    state = stateMenu;
    break; 
  case stateHelp:
    // Volver al juego
    state = stateGame;
    break;  
  case stateMenu:
    
    switch (key) {
    case '1' :
      playerNumber = 2;
      state = stateGame;
      break;
    case '2' :
      playerNumber = 4;
      state = stateGame;
      break;
    case 'x':
      exit();
      break;
    default :
      println ("unknown input");
      break;
    } 
    break; 
  default:
    // error 
    break;
  } 
  
}
 
// =====================================================================
 
void signHome(int x, int y) {
  
}
