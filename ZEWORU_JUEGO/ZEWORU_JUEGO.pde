String gameState;
PImage img;
PImage tImg;
PImage uImg;
Zero zero;
int wins;
int losses;
ArrayList<Fire> fires = new ArrayList<Fire>();
//
Timer countDownTimer;
int timeLeft;
int maxTime;
//
void mousePressed() {
  fires.add(new Fire());
}

void setup() {
  size(1280,680);
  gameState = "START";
  img = loadImage("bg.png");
  tImg = loadImage("Fire.png");
  uImg = loadImage("zero.png");
  zero = new Zero();
  wins = 0;
  losses = 0;
  
  countDownTimer = new Timer(1000);
  maxTime = 60;
  timeLeft = maxTime;
  
}
void keyPressed() {
  if (key == ' ') {
    zero.jump();
  }
}  


void draw() {
  clearBackground();
  image(img,0,0);
  if (gameState == "START") {
    starGame();
  }
  else if (gameState == "PLAY") {
    playGame();
  }
  
    else if (gameState == "WIN") {
    winGame();
  }
  else if (gameState == "LOSE") {
    loseGame();
  }
}

void starGame() {
  fill(0, 50);  // Cuadro Transparente
  rect (100, 100, width-200, height-200, 15, 15, 15, 15);
  fill(255, 0, 0); // red 
  textSize(48);
  text ("Welcome to Zeworu!", width/2-100, height /2);
  fill(0);
  textSize(22);
  text ("To Start, Click Anywhere", width/2-10, height /2+60);
  //
  if (mousePressed == true) {
    gameState = "PLAY";
    countDownTimer.start();
  }
  showScore();
}

void playGame() {
  fill(0, 15, 240);
  rect(mouseX, mouseY, 25, 34);
  //
   if (random(1) < 0.005) {
    fires.add(new Fire());
  }

  for (Fire f : fires) {
    f.move();
    f.show();
    
  }
    
  if (mouseX < 50) {
    //lose
    losses++;
    gameState = "LOSE";
  }for (Fire f : fires) {
    f.move();
    f.show();
   if (zero.hits(f)) {
            noLoop();
            
  zero.show();
  zero.move();
  }
  
  
  
   if (mouseX > width - 30) {
    //win
    wins++;
    gameState = "WIN";
   }
   //
   if (countDownTimer.complete() == true) {
     if (timeLeft > 1) {
       timeLeft --;
       countDownTimer.start();
     }
     else {
       gameState = "LOSE";
     }
   }
  // TEMPORIZADOR 
   String s = "Time left: " + timeLeft;
   textAlign(LEFT);
   textSize(15);
   fill(255, 0, 0);
   text(s, 20, 100);
   
  }
}
void winGame() {
 fill(0, 50);  // Cuadro Transparente
  rect (100, 100, width-200, height-200, 15, 15, 15, 15);
  fill(255, 0, 0); // red 
  textSize(48);
  text ("That's Great", width/2-100, height /2);
  fill(0);
  textSize(22);
  text ("Play Again?", width/2-10, height /2+60);
  //
  drawReplayButton();
  showScore();
}
void loseGame() {
  fill(0, 50);  // Cuadro Transparente
  rect (100, 100, width-200, height-200, 15, 15, 15, 15);
  fill(255, 0, 0); // red 
  textSize(48);
  text ("You lost!", width/2-100, height /2);
  fill(0);
  textSize(22);
  text ("Try Again?", width/2-10, height /2+60);
  //
  drawReplayButton();
  showScore();
}
void resetGame() {
  timeLeft = maxTime;
  countDownTimer.start();
}
void showScore() {
  textAlign(LEFT);
  textSize(15);
  fill(0);
  String s = "Wins: " + wins + "\n" + "Losses: " + losses;
  text(s, 20, 50);
}
void drawReplayButton() {
  fill(200);
  rect(width/2-5, height/2+80, 100, 60, 5, 5, 5, 5);
  fill(0);
  textSize(28);
  text("PLAY", width/2+13, height/2+120);
  //
  float leftEdge = width/2 - 20;
  float rightEdge = width/2 + 50;
  float topEdge = height/2 + 80;
  float bottomEdge = height/2 + 140;
  //
  if (mousePressed == true && 
  mouseX > leftEdge && 
  mouseX < rightEdge &&
  mouseY > topEdge &&
  mouseY < bottomEdge
  ) {
    resetGame();
    gameState = "PLAY";
  }
}
void clearBackground() {
  fill(255);
  rect(0, 0, width, height);
}
// =====================================================================
