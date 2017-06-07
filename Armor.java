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

  //returns the amount of nodes in the heap.
  public int size() {
    return _armor.size();
  }

  //tells whether or not a certain level exists.
  public boolean levelAlive(int lvl) {
    if ( _armor.size() > 0)
      return lvl - 1 <= _armor.get(_armor.size()-1);
    else
      return false;
  }

  //toString() method for testing
  public String toString() 
  { 
    return _armor.toString();
  }

  //modifyier -- sets level, which determines amount of nodes in the tree.
  public void setLevel(int lvl) {
    level = lvl;
  }

  //returns the current highest level.
  public int peek() {
    return _armor.get(_armor.size()-1);
  }

  //removes maximum value, which is used when a ship is hit.
  //when a ship is hit, a node is removed.
  //when certain levels are completely destroyed, components of the actual ship are destroyed (guns, ammo, engines).
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
    } else {
      ret = "";
    }
    return ret;
  }

  public int[] working() {
    int[] works = {0, 0, 0};
    if ( levelAlive(4)) {
      works[0] = 1;
    } 
    if ( levelAlive(3)) {
      works[1] = 1;
    } 
    if ( levelAlive(2)) {
      works[2] = 1;
    }
    return works;
  }
}