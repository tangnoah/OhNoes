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
    
    public int size(){
	return _armor.size();
    }
    
    public String toString() 
    { 
	return _armor.toString();
    }

    public void setLevel(int lvl) {
	level = lvl;
    }
    public void removeMax(){
	_armor.removeMax();
    }
}
