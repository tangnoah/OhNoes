public class Armor{
    
    public ALHeap _armor;
    private int level;

    //constructor
    public Armor(){
	ALHeap _armor = new ALHeap();
    }
    
    //overloaded constructor (mayb?)
    public Armor(int lvl){
	//Fills each level with nodes each containing the number of the level.
        for(int temp = 0; temp <= lvl; temp++){
	    for(int count = (int)Math.pow(2, lvl); count >= 0; count--){
		_armor.add(lvl);
	    }
	}
    }
    public void setLevel(int lvl){
	level = lvl;
    }
}
