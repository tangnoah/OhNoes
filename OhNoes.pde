ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?
PFont titleF;
String gameState = "";
// null - game not started
// selection - picking a ship screen

void setup() {
  background(0, 200, 244); 
  size(700, 500);
  titleF = loadFont("Disparador-Stencil-48.vlw");
  textFont(titleF);
  startGame();
}

void startGame() {
  title();
  textSize(48);
  fill(25);
  text("In this game you are an Admiral, and you must \n vanquish your sea-faring foes in exciting naval combat.", 350, 200);
  startButtons();
}

void title() {
  textSize(72);
  textAlign(CENTER);
  fill(90);
  text("WELCOME TO ABoF GOTY EDITION", 350, 100);
}

void startButtons() {
  fill(150);
  rect(200, 320, 110, 40);
  rect(390, 320, 110, 40);
  fill(90);
  text("NEW GAME", 255, 348);
  text("HELP", 445, 348);
}

void mouseClicked() {
  if (gameState.equals("")) {
    if ( mouseX > 200 && mouseX < 310 && mouseY > 320 && mouseY < 360) {//start game
      background(0, 200, 244);
      text("THE GAME STARTS HERE", 350, 250);
      gameState = "selection";
      game();
    }
    if ( mouseX > 390 && mouseX < 500 && mouseY > 320 && mouseY < 360) {//help menu
      background(0, 200, 244);
      text("HELP", 350, 100);
      fill(150);
      rect(295, 320, 110, 40);
      fill(90);
      text("BACK", 350, 348);
    }
    if ( mouseX > 295 && mouseX < 405 && mouseY > 320 && mouseY < 360) {//back to start
      setup();
    }
  }
  if (gameState.equals("selection")) {
  }
}

void draw() {
}

void game() {
   background(0, 200, 244);
  text( "Player One, enter name now:", 350, 250);
  prompt();
  text( _inputs.get(_inputs.size()-1), 350, 350);
}

void keyPressed(){
  
}