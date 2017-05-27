ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?
PFont titleF;

void setup() {
  background(0, 200, 244); 
  size(700, 500);
  titleF = loadFont("Disparador-Stencil-48.vlw");
  textFont(titleF);
  startGame();
}

void startGame() {
  title();
  
}

void title(){
  textSize(72);
  textAlign(CENTER);
  text("Welcome to ABoF GOTY Edition", 350, 100);
}