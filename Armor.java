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
    public boolean levelAlive(int lvl){
	return lvl < _armor.get(_armor.size()-1);
    }

    public String toString() 
    { 
	return _armor.toString();
    }
    
    public void setLevel(int lvl) {
	level = lvl;
    }
    public int peek(){
	return _armor.get(_armor.size());
    }
    public String removeMax(){
	_armor.removeMax();
	if(! _armor.levelAlive(3)){
	    return "guns";
	}
	else if(! _armor.levelAlive(2)){
	    return "ammo";
	}
	else if(! _armor.levelAlive(1)){
	    return "engines";
	}
	else if(! _armor.levelAlive(0)){
	    return "captain";
	}
	else{
	    return "";
	}
    }
}
