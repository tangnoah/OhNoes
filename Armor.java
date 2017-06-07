public class Armor {

  private ALHeap _armor;
  private int level;

  //constructor
  public Armor() {
    _armor = new ALHeap();
  }

  //overloaded constructor
  public Armor(int lvl) {
    _armor = new ALHeap();
    //Fills each level with nodes each containing the number of the level.
    for (int temp = 0; temp <= lvl; temp++) {
      for (int count = (int)Math.pow(2, temp); count >= 1; count--) {
        _armor.add(temp);
      }
    }
  }

  public int size() {
    return _armor.size();
  }

  //Tells whether or not a certain level exists.
  public boolean levelAlive(int lvl) {
    if ( _armor.size() > 0)
    return lvl - 1 <= _armor.get(_armor.size()-1);
    else
      return false;
  }

  public String toString() 
  { 
    return _armor.toString();
  }

  public void setLevel(int lvl) {
    level = lvl;
  }
  public int peek() {
    return _armor.get(_armor.size());
  }
  public String removeMax() {
    String ret = "";
    int end = _armor.get(_armor.size()-1);
    _armor.removeMax();
    if (!levelAlive(4) && _armor.size() > 0 && end == 3 ) {
      ret = "guns";
    } else if (!levelAlive(3) && _armor.size() > 0 && end == 2) {
      ret = "ammo";
    } else if (!levelAlive(2) && _armor.size() > 0 && end == 1) {
      ret = "engines";
    }
     else {
      ret = "";
    }
    return ret;
  }
  public int[] working(){
    int[] works = {0, 0, 0};
    if ( levelAlive(4)) {
      works[0] = 1;
    } if ( levelAlive(3)) {
       works[1] = 1;
    } if ( levelAlive(2)) {
       works[2] = 1;
    }
    return works;
  }
}