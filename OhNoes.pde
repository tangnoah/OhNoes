ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?
int turnCount = 1;
PFont titleF;
String gameState = "";
String message = "Welcome";
float turned = 0;
float moved = 0;
ArrayPriorityQueue<Ship> _shipOrder = new ArrayPriorityQueue<Ship>();
String[] classList = { "Destroyer", "Gunboat", "Cruiser"};
int temp = 0;
int targeted = 0;
// null - game not started
// selection - picking a ship screen
int[] points = {0, 0};

void setup() {
  background(0, 200, 244); 
  size(700, 500);
  titleF = loadFont("Disparador-Stencil-48.vlw");
  textFont(titleF);
  startGame();
  /*String[] attributes = loadStrings( "Destroyer-attributes.txt");
   Ship a = new Ship( 
   int(attributes[0]), 
   int(attributes[1]), 
   int(attributes[2]), 
   int(random(20, 450)), 
   int(random(20, 440)), 
   int(attributes[3]), 
   int(attributes[4]), 
   1, "Destroyer");  
   attributes = loadStrings( "Gunboat-attributes.txt");      
   Ship b = new Ship( 
   int(attributes[0]), 
   int(attributes[1]), 
   int(attributes[2]), 
   int(random(20, 450)), 
   int(random(20, 440)), 
   int(attributes[3]), 
   int(attributes[4]), 
   1, "Destroyer");
   print(b.compareTo(a)); */
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
  text("On Your Turn: \n \n 1. Move your ships using the arrow keys. You can rotate and move within \ncertain limits determined by your ship's class. \n 2. Attack by pressing A and choosing a target with left/right arrows. Shoot with ENTER. Cancel the attack with 'c' \n 3. Surrender by pressing 's'. Surrendering will cost you 1500 points. \n 4.Wait for your turn again and reread these instructions if needed.", 350, 150);
}


void mouseClicked() {
  //debugging:
  //print (_shipOrder + "\n");
  //print ("----------------------------\n" + _ships + "\n");
  if (gameState.equals("help")) {
    gameState = "battle";
  }
  if (gameState.equals("shipSunk")) {
    gameState = "battle";
  }
  if (gameState.equals("")) {
    if ( mouseX > 200 && mouseX < 310 && mouseY > 320 && mouseY < 360) {//start game
      background(0, 200, 244);
      //text("THE GAME STARTS HERE", 350, 250);
      gameState = "selection";
    }
    if ( mouseX > 390 && mouseX < 500 && mouseY > 320 && mouseY < 360) {//help menu
      background(0, 200, 244);
      text("HELP", 350, 100);
      textSize(36);
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

//DRAW ======================================= DRAW
void draw() {
  if ( gameState.equals("battle")) {
    background(0, 200, 244);
    //ad a new font here
    fill(100);
    for ( Ship b : _ships) {

      translate(b.getPos()[0]+25, b.getPos()[1]+5);
      rotate(b.getHeading());
      translate(-25, -5);
      if ( _shipOrder.peekMax() == b) { //IS THIS THE CURRENTLY SELECTED SHIP? YES: HILITE IN GREEN
        fill(#34EA28  );
        rect(-4, -4, 58, 18, 2);
        triangle(57, -4, 57, 15, 65, 5);
      }
      if ( b.getOwner() == 1) {
        fill(100);
      } else if ( b.getOwner() == 2) {
        fill(50);
      }
      rect( 0, 0, 50, 10, 2);
      translate(25, 5);
      rotate( - (b.getHeading()) );
      translate(-(b.getPos()[0]+25), -(b.getPos()[1]+5));
    }
    fill(51, 51, 0);
    rect(500, 0, 200, 500);
    fill( 255);
    text( "Turn" + turnCount, 600, 30);
    text( "Current ship\nPlayer " + _shipOrder.peekMax().getOwner() + "\nClass: " + _shipOrder.peekMax().getDesc(), 600, 110);
    text( message, 600, 50);
    if ( _ships.size() <= 1) {
      gameState = "end";
    }
  }
  if ( gameState.equals("end")) {
    image( loadImage("im1.png"), 0, 0); 
    fill(#FF1717);
    textFont( loadFont("BalloonistSFBold-80.vlw") );
    textSize(60);
    if ( points[0] > points[1]) {
      text( "PLAYER 1 VICTORY", 350, 60);
      text( "P1\n" + points[0], 100, 150);
      text( "P2\n" + points[1], 600, 150);
    } else if ( points[0] > points[1]) {
      text( "PLAYER 2 VICTORY", 350, 60); 
      text( "P1\n" + points[0], 100, 150);
      text( "P2\n" + points[1], 600, 150);
    } else {
      text( "DRAW", 350, 60); 
      text( "P1\n" + points[0], 100, 150);
      text( "P2\n" + points[1], 600, 150);
    }
  }
  if ( gameState.equals("attack")) {
    background(0, 200, 244);
    //ad a new font here
    fill(100);
    for ( Ship b : _ships) {

      translate(b.getPos()[0]+25, b.getPos()[1]+5);
      rotate(b.getHeading());
      translate(-25, -5);
      if ( _shipOrder.peekMax() == b) { //IS THIS THE CURRENTLY SELECTED SHIP? YES: HILITE IN GREEN
        fill(#34EA28  );
        rect(-4, -4, 58, 18, 2);
        triangle(57, -4, 57, 15, 65, 5);
      }
      if ( _ships.get(targeted) == b) {  //IS THIS THE CURRENTLY TARGETED SHIP? YES: HILITE IN RED
        fill(#FA1717  );
        rect(-4, -4, 58, 18, 2);
      }
      if ( b.getOwner() == 1) {
        fill(100);
      } else if ( b.getOwner() == 2) {
        fill(50);
      }
      rect( 0, 0, 50, 10, 2);
      translate(25, 5);
      rotate( - (b.getHeading()) );
      translate(-(b.getPos()[0]+25), -(b.getPos()[1]+5));
    }
    fill(#FA1717  );
    rect(500, 0, 200, 500);
    fill( 255);
    text( "READY TO FIRE", 600, 30);
    text( "TARGETING:\n" + _ships.get(targeted).getDesc(), 600, 110);
    text( message, 600, 50);
  }

  if ( gameState.equals("shipSunk")) {
    image( loadImage("shipSmoking.png"), 0, 0);
    fill( 0);
    textSize(20);
    text( "Player " + _ships.get(targeted).getOwner() + "'s " + _ships.get(targeted).getDesc()  + " has been sunk!", 350, 40);
  }
  if ( gameState.equals("selection")) {
    textFont( loadFont("CourierNewPS-BoldMT-24.vlw") );
    background(51, 51, 0);
    fill(255);
    text("Player Two", 550, 25 );
    text("Player One", 150, 25 );
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
        image( loadImage(b.getDesc() + ".png"), 60, nextYl);
        text( b.getDesc(), 100, nextYl + 50);
        nextYl += 60;
      }
      if (b.getOwner() == 2) {
        image( loadImage(b.getDesc() + ".png"), 460, nextYr);
        text( b.getDesc(), 500, nextYr + 50);
        nextYr += 60;
      }
    }
    fill( 255);
    textFont( loadFont("CourierNewPS-BoldMT-20.vlw"));
    text( "Press A to\n add ships.\n\nPress ENTER\n to start\n the game.", 350, 250);
  }

  if ( gameState.equals("add")) {
    textFont( loadFont("CourierNewPS-BoldMT-20.vlw") );
    background(51, 51, 0);
    fill(255);
    fill(0);
    rect(20, 20, 360, 460); 
    image(loadImage("supply.jpg"), 25, 25);
    fill(255);
    text( "Constructing a New Ship", 540, 30);
    textFont( loadFont("CourierNewPS-BoldMT-14.vlw") );
    text( "Use arrow Keys to choose ship class", 540, 60);
    rect(400, 70, 200, 60);
    image( loadImage( classList[temp] + ".png"), 410, 80);
    fill( 0);
    text( classList[temp], 530, 100);
    fill(255);
    text( "Press 1 to add to Player 1's group\nand 2 to add to Player 2's group.", 540, 400);
  }
}


//KEYPRESSED ======================================= KEYPRESSED
void keyPressed() {
  if ( gameState.equals("battle")) {
    if (key == CODED) {
      if ( keyCode == LEFT && turned <= _shipOrder.peekMax().getTurnRate()) {
        _shipOrder.peekMax().rotate( -PI/36);
        turned += PI/36;
      }
      if ( keyCode == RIGHT && turned <= _shipOrder.peekMax().getTurnRate()) {
        _shipOrder.peekMax().rotate( PI/36);
        turned += PI/36;
      }
      if ( keyCode == UP && moved <= _shipOrder.peekMax().getSpeed()) {
        _shipOrder.peekMax().move( 1.5);
        moved += 1;
      }
      if ( keyCode == DOWN && moved <= _shipOrder.peekMax().getSpeed()) {
        _shipOrder.peekMax().move( -1.5);
        moved += 1;
      }
    }
    if ( key == ENTER || key == RETURN) {
      passTurn();
    }
    if ( key == 'a' || key =='A') {
      gameState = "attack";
      targeted = 0;
    }
    if ( key == 'h' || key == 'H') {
      gameState = "help";
      fill( #228314);
      rect( 0, 0, 700, 500);
      textSize(12);
      helpText();
    }
    if ( key == 's' || key == 'S') {
      points[_shipOrder.peekMax().getOwner() - 1] -= 1500;
      gameState = "end";
    }
  } else if (gameState.equals("help")) {
    textSize(20);
    gameState = "battle";
  }

  if (gameState.equals("shipSunk")) {
    textSize(20);
    gameState = "battle";
    _ships.remove( targeted);
  }

  if ( gameState.equals( "selection")) {
    if ( key == 'A' || key == 'a') {
      gameState = "add"; 
      temp = 0;
    }
    if ( key == ENTER || key == RETURN) {
      gameState = "battle";
      for ( Ship b : _ships) {
        _shipOrder.add(b);
      }
    }
  }

  if ( gameState.equals( "add")) {
    if ( key == CODED && keyCode == RIGHT && temp < classList.length - 1) {
      temp += 1;
    }
    if ( key == CODED && keyCode == LEFT && temp > 0) {
      temp -= 1;
    }
    if ( key == '1' || key == '2') {
      String[] attributes = loadStrings( classList[temp] + "-attributes.txt");
      _ships.add( new Ship( 
        int(attributes[0]), 
        int(attributes[1]), 
        int(attributes[2]), 
        int(random(20, 450)), 
        int(random(20, 440)), 
        int(attributes[3]), 
        int(attributes[4]), 
        int(attributes[5]), 
        Character.getNumericValue(key), classList[temp]) );
      temp = 0;
      gameState = "selection";
    }
  }

  if ( gameState.equals("attack")) {
    if ( key == CODED && keyCode == RIGHT )
      if ( targeted < _ships.size() - 1)
        targeted += 1;
      else
        targeted = 0;
    if ( key == CODED && keyCode == LEFT ) {
      if ( targeted > 0 )
        targeted -= 1;
      else
        targeted = _ships.size() - 1;
    }
    if ( key == 'c' || key == 'C') {
      //CANCEL FIRE
      gameState = "battle";
    }
    if ( key == ENTER || key == RETURN) {
      //ATTACK FORMULA HERE
      print (int(sqrt( sq(_shipOrder.peekMax().getPos()[0] - _ships.get(targeted).getPos()[0]) + sq(_shipOrder.peekMax().getPos()[1] - _ships.get(targeted).getPos()[1]) ) ) + "\n");
      print (_ships.get(targeted).armor.size() + "\n");
      for ( float hits = 100; 
        hits > sqrt( sq(_shipOrder.peekMax().getPos()[0] - _ships.get(targeted).getPos()[0])
        + sq(_shipOrder.peekMax().getPos()[1] - _ships.get(targeted).getPos()[1]) ); 
        hits -= 1) {
        
        if (!(_ships.get(targeted).alive()) ) {
          points[_ships.get(targeted).getOwner() % 2] += _ships.get(targeted).getValue();
          gameState = "shipSunk";
          return;
        }
        if ( random(100) <= _shipOrder.peekMax().getAttack() ){
          _ships.get(targeted).hit();
          print ("DING\n");
        }
      }
      passTurn();
      gameState = "battle";
    }
  }
}

void passTurn() {
  _shipOrder.removeMax();
  if ( _shipOrder.isEmpty()) {
    for ( Ship b : _ships) {
      _shipOrder.add(b);
    }
  }
  turned = 0;
  moved = 0;
}