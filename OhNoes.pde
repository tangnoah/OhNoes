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
// null - game not started
// selection - picking a ship screen

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
  textSize(36);
  text("On Your Turn: \n \n 1. Move your ships using the arrow keys. You only get one turn and one move per ship. \n 2. Select a ship to attack by clicking and pray to RNGesus. Shoot with SPACE. \n 3. Wait for your turn again and reread these instructions if needed.", 350, 150);
}


void mouseClicked() {
  if (gameState.equals("")) {
    if ( mouseX > 200 && mouseX < 310 && mouseY > 320 && mouseY < 360) {//start game
      background(0, 200, 244);
      //text("THE GAME STARTS HERE", 350, 250);
      gameState = "selection";
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
      if ( _shipOrder.peekMax() == b) { //IS THIS THE CURRENTLY SELECTED SHIP? YES: HILITE IN RED
        fill(#FF0A0A  );
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
    if( key == ENTER) {
      _shipOrder.removeMax();
      if( _shipOrder.isEmpty()){
        for( Ship b: _ships){
          _shipOrder.add(b); 
        }
      }
      turned = 0;
      moved = 0;
    }
    if( key == 'a' || key =='A'){
      gameState = "attack"; 
    }
  }

  if ( gameState.equals( "selection")) {
    if ( key == 'A' || key == 'a') {
      gameState = "add"; 
      temp = 0;
    }
    if ( key == ENTER || key == RETURN) {
      for (Ship b : _ships) {
        _shipOrder.add(b);
      }
      gameState = "battle";
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
        Character.getNumericValue(key), classList[temp]) );
      temp = 0;
      gameState = "selection";
    }
  }
}