public class Ship{

    //Instance vars
    private int attackStat;
    private int armorStat;
    private int speedStat;
    private boolean isLives;
    public Ship boat;
    private Armor armor;

    //constructor
    public Ship(){
	Ship boat = new Ship();
    }

    //Accessors
    public boolean alive(){
	return isLives;
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
}
