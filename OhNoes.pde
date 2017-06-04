ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?
int turnCount = 1;
PFont titleF;
String gameState = "";
String message = "";
float turned = 0;
float moved = 0;
ArrayPriorityQueue<Ship> _shipOrder = new ArrayPriorityQueue<Ship>();
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
      //text("THE GAME STARTS HERE", 350, 250);
      gameState = "selection";
      selection();
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
  }
}

void draw() {
  if ( gameState.equals("battle")) {
    background(0, 200, 244);
    fill(51, 51, 0);
    rect(500, 0, 200, 500);
    fill( 255);
    //ad a new font here
    text( message, 550, 50);
    fill(256, 256, 256);
    for ( Ship b : _ships) {
      translate(b.getPos()[0]+25, b.getPos()[1]+5);
      rotate(b.getHeading());
      translate(-25, -5);
      rect( 0, 0, 50, 10);
      translate(25, 5);
      rotate( - (b.getHeading()) );
      translate(-(b.getPos()[0]+25), -(b.getPos()[1]+5));
    }
  }
  if ( gameState.equals("selection")) {
    textFont( loadFont("CourierNewPS-BoldMT-24.vlw") );
    background(51, 51, 0);
    fill(255);
    text("Player One", 550, 25 );
    text("Player Two", 150, 25 );
    fill(0);
    rect(440, 40, 220, 420);
    rect(40, 40, 220, 420);
    fill(100);
    rect(450, 50, 200, 400);
    rect(50, 50, 200, 400);
    int nextYl = 60;
    int nextYr = 60;
    fill( 0);
    textFont( loadFont("CourierNewPS-BoldMT-14.vlw"));
    for ( Ship b : _ships) {
      if (b.getOwner() == 1) {
        image( loadImage("destroyer.png"), 60, nextYl);
        text( b.getDesc(), 100, nextYl + 50);
        nextYl += 60;
      }
      if (b.getOwner() == 2) {
        image( loadImage("destroyer.png"), 460, nextYr);
        text( b.getDesc(), 500, nextYr + 50);
        nextYr += 60;
      }
    }
    fill( 255);
    textFont( loadFont("CourierNewPS-BoldMT-20.vlw"));
    text( "Press A to\n add ships.", 350, 250);
  }
  
  if( gameState.equals("add")){
    textFont( loadFont("CourierNewPS-BoldMT-24.vlw") );
    background(51, 51, 0);
    fill(255);
    fill(0);
    rect(20,20, 360, 460); 
    image(loadImage("supply.jpg"), 25, 25);
  }
}

void selection() {
  _ships.add( new Ship( 10, 10, 30, 100, 100, 0, PI/2, 1, "Destroyer") );
  _ships.add( new Ship( 10, 10, 30, 100, 100, 0, PI/2, 2, "Destroyer") );
}

void game() {
  message = "Welcome";

  background(0, 200, 244);
  fill(51, 51, 0);
  rect(500, 0, 200, 500);
  fill(256, 256, 256);
}

void keyPressed() {
  if ( gameState.equals("battle")) {
    if (key == CODED) {
      if ( keyCode == LEFT && turned <= _ships.get(0).getTurnRate()) {
        _ships.get(0).rotate( -PI/36);
        turned += PI/36;
      }
      if ( keyCode == RIGHT && turned <= _ships.get(0).getTurnRate()) {
        _ships.get(0).rotate( PI/36);
        turned += PI/36;
      }
      if ( keyCode == UP && moved <= _ships.get(0).getSpeed()) {
        _ships.get(0).move( 1.5);
        moved += 1;
      }
      if ( keyCode == DOWN && moved <= _ships.get(0).getSpeed()) {
        _ships.get(0).move( -1.5);
        moved += 1;
      }
    }
  }
  
  if ( gameState.equals( "selection")){
    if( key == 'A' || key == 'a'){
     gameState = "add"; 
    }
  }
}