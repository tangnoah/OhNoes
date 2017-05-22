public class ship{

    //Instance vars
    private int attackStat;
    private int armorStat;
    private int speedStat;
    private boolean isLives;


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
    public int speedStat(){
	return speedStat;
    }

    
}
