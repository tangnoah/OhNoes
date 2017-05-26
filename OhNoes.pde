ArrayList<Ship> _ships= new ArrayList<Ship>();
int currentTurn = 0; // which player's turn is it?

void setup() {
  background(0, 200, 244); 
  size(700, 500);
  startGame();
}

void startGame() {
  PFont titleF;
  titleF = createFont("disparador_stencil.tff", 32);
  textFont(titleF);
  text("Welcome to ABoF GOTY Edition", 12, 45, -30);
}