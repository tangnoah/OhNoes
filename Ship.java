public class Ship{

    //Instance vars
    private int attackStat;
    private int armorStat;
    private int speedStat;
    private Ship boat;
    private Armor armor;

    //constructor
    public Ship(){
	Ship boat = new Ship();
    }

    //Accessors
    public boolean alive(){
	//if your armor is gone and the root is null, then you ded.
	return armor.size() <= 0;
    }
    public int getAttack(){
	return attackStat;
    }
    public int getArmor(){
	return armorStat;
    }
    public int getSpeed(){
	return speedStat;
    }
    
    //modifiers
    public int setAttack(int newAttack){
	int temp = boat.getAttack();
	attackStat = newAttack;
	return temp;
    }
    public int setArmor(int newArmor){
	int temp = boat.getArmor();
	armorStat = newArmor;
	return temp;
    }
    public int setSpeed(int newSpeed){
	int temp = boat.getSpeed();
	speedStat = newSpeed;
	return temp;
    }
    //attack -- if a different ship hits you, you lose a node of your armor.
    public boolean attack(Ship s){
	if((int)(Math.random()*100*attackStat) > (int)(Math.random()*100*s.getArmor())){
	    s.hit();
	    return true;
	}
	return false;
    }
    //if you are hit you remove a node of your armor.
    public void hit(){
	armor.removeMax();
    }
}
