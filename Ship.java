public class Ship implements Comparable {

  //Instance vars
  private int attackStat;
  private int armorStat;
  private int speedStat;
  public Armor armor;
  private float x;
  private float y;
  private float heading;
  private float turnRate;
  private int owner;
  private String desc;
  private int value;

  //constructor
  public Ship() {
    Armor armor = new Armor();
  }

  public Ship( int atS, int arS, int spS, float xP, float yP, float he, float tu, int newValue, int ow, String newDesc ) {
    this();
    attackStat = atS;
    armorStat = arS;
    speedStat = spS;
    x = xP;
    y = yP;
    heading = he;
    turnRate = tu;
    owner = ow;
    desc = newDesc;
    armor = new Armor(armorStat);
    value = newValue;
  }
  //interface compliance
  public int compareTo(Object o) {
    Ship s = (Ship) o;
    if ( s.getSpeed() > speedStat) {
      return -1;
    } else if ( s.getSpeed() < speedStat) {
      return 1;
    } else {
      return 0;
    }
  }

  //Accessors
  public String getDesc() {
    return desc;
  }
  public boolean alive() {
    //if your armor is gone and the root is null, then you ded.
    return armor.size() > 0;
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
    int[] posArr = { (int)x, (int)y};
    return posArr;
  }
  public float getHeading() {
    return heading;
  }
  public float getTurnRate() {
    return turnRate;
  }
  public int getOwner() {
    return owner;
  }
  public int getValue() {
    return value;
  }

  //modifiers
  public String setDesc( String newDesc) {
    String temp = desc;
    desc = newDesc;
    return temp;
  }
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
  public float rotate( float degrees) {  //check whats working by calling working in armor
    if ( working()[2] == 1 ) {
      if ( Math.abs(degrees) <= turnRate) {
        heading += degrees;
      } else if ( degrees < 0) {
        heading -= turnRate;
      } else if ( degrees > 0) {
        heading += turnRate;
      }
    }
    return heading;
  }

  //move
  public void move( float units ) {
    if ( working()[2] == 1 ) {
      if ( Math.abs(units) <= speedStat) { 
        x += ( Math.cos(heading) * units ); 
        y += ( Math.sin(heading) * units );
      }
    }
  }

  //status report
  public int[] working() {
    return armor.working();
  }
  //if you are hit you remove a node of your armor.
  public String hit() {
    return armor.removeMax();
  }
}