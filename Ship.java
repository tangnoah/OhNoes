public class Ship {

  //Instance vars
  private int attackStat;
  private int armorStat;
  private int speedStat;
  private Armor armor;
  private int x;
  private int y;
  private float heading;
  private float turnRate;
  private int owner;

  //constructor
  public Ship() {
    Armor armor = new Armor();
  }

  public Ship( int atS, int arS, int spS, int xP, int yP, float he, float tu, int ow) {
    this();
    attackStat = atS;
    armorStat = arS;
    speedStat = spS;
    x = xP;
    y = yP;
    heading = he;
    turnRate = tu;
    owner = ow;
  }

  //Accessors
  public boolean alive() {
    //if your armor is gone and the root is null, then you ded.
    return armor.size() <= 0;
  }
  public int getAttack() {
    return attackStat;
  }
  public int getArmor() {
    return armorStat;
  }
  public int getSpeed() {
    return speedStat;
  }
  public int[] getPos() {
    int[] posArr = { x, y};
    return posArr;
  }
  public float getHeading() {
    return heading;
  }

  //modifiers
  public int setAttack(int newAttack) {
    int temp = getAttack();
    attackStat = newAttack;
    return temp;
  }
  public int setArmor(int newArmor) {
    int temp = getArmor();
    armorStat = newArmor;
    return temp;
  }
  public int setSpeed(int newSpeed) {
    int temp = getSpeed();
    speedStat = newSpeed;
    return temp;
  }
  //attack -- if a different ship hits you, you lose a node of your armor.
  public boolean attack(Ship s) {
    if ((int)(Math.random()*100*attackStat) > (int)(Math.random()*100*s.getArmor())) {
      s.hit();
      return true;
    }
    return false;
  }
  //change heading
  public float rotate( float degrees) {
    if ( Math.abs(degrees) <= turnRate) {
      heading += degrees;
    } else if ( degrees < 0) {
      heading -= turnRate;
    } else if ( degrees > 0) {
      heading += turnRate;
    }
    return heading;
  }

  //move
  public void move( int units ) {
    if ( Math.abs(units) <= speedStat) { 
      x += (int)( Math.cos(heading) * units ); 
      y += (int)( Math.sin(heading) * units );
    } else if ( units > 0) {
      x += (int)( Math.cos(heading) * speedStat ); 
      y += (int)( Math.sin(heading) * speedStat );
    } else if ( units > 0) {
      x -= (int)( Math.cos(heading) * speedStat ); 
      y -= (int)( Math.sin(heading) * speedStat );
    }
  }

  //if you are hit you remove a node of your armor.
  public void hit() {
    armor.removeMax();
  }
}