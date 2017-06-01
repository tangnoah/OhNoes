ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?
int turnCount = 1;
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

void helpText() {
  fill(0);
  textSize(36);
  text("On Your Turn: \n \n 1. Move your ships using the arrow keys. You only get one turn and one move per ship. \n 2. Select a ship to attack by clicking and pray to RNGesus. Shoot with SPACE. \n 3. Wait for your turn again and reread these instructions if needed.", 350, 150);
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
      helpText();
      fill(150);
      rect(295, 320, 110, 40);
      fill(90);
      textSize(48);
      text("BACK", 350, 348);
    }
    if ( mouseX > 295 && mouseX < 405 && mouseY > 320 && mouseY < 360) {//back to start
      setup();
    }
  }
  if (gameState.equals("selection")) {
    //help button
  }
}

void draw() {
  if ( gameState.equals("battle")) {
    background(0, 200, 244);
    fill(51, 51, 0);
    rect(500, 0, 200, 500);
    fill(256, 256, 256);
    for ( Ship b : _ships) {
      translate(b.getPos()[0], b.getPos()[1]);
      rotate(b.getHeading());
      rect( b.getPos()[0]-25, b.getPos()[1]-5, 50, 10);
    }
  }
}

void game() {

  gameState = "battle";
  _ships.add( new Ship( 10, 10, 10, 10, 10, 0, PI/2, 0) );
  background(0, 200, 244);
  fill(51, 51, 0);
  rect(500, 0, 200, 500);
  fill(256, 256, 256);
}

void keyPressed() {
}