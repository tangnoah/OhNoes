**A Boatload of Fun! GOTY Edition**

OhNoes: Noah Tang, Maria Acuna, Alessandro Cartegni (Period 3)



You vs. the guy she tells you not to worry about

 _~
    _~ )_)_~
    )_))_))_)
    _!__!__!_
    \______t/
  ~~~~~~~~~~~~~
     ====
      ||
   ()-||-()
 __ \ = =/   _/  _/  ___
|  \_|__|\__| |_| |_|   \====___/|
|_____(_)______(_)_______________/~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\_______________________________/~   ~   ~    ~   ~       ~

Sailboat ascii art:  http://www.ascii-art.de/ascii/ab/boat.txt
Ship ascii art: Noah Tang



*Overview*

Our project idea is to make a top-down naval warfare game. The player would take control of a small fleet and fight against either a randomized fleet or another player.  The game will be turn-based and take place on an open-water field. Victory is achieved by the complete destruction of the opposing side’s fleet. Ratings will be given at the conclusion of the game to summarize just how well each player did.


*Minimum Viable Product*

The ability to play a full game against another person at the computer. Ships will have properties selected from a set of pre-programmed options.  Turn based.  You will choose what ship you want to hit with your weapons, and the damage dealt would be determined by your attack stat.  An accuracy mechanism will not be implemented in the first version.

*Second-semester Learning*

PRIORITY QUEUE
In order to implement second term concepts, we would use a priority queue in order to determine the order in which the players would take turns.  The priority queue would hold ships.  The basis for priority would be the weapon speed rating of the ship.  The weapon speed rating for each ship would be put into a queue.  Harold suggests that we represent the quickest weapons as lower ints, and remove the lowest elements first.  In the MVP, the game would be turn based, and would involve de-queueing the all the ships in the order in which they fire and then re-enqueueing them each turn.  In a later version, the game would be time based, which the weapon speed rating would represent seconds, and they would be decremented by one each “turn”.  Once your rating reaches zero, you’d be able to fire your weapons again.

TREES
We would also use trees in order to represent internal components. This is kind of like the layers of defense in the immune system; an attack must breach outer defenses before destroying vital internal components.  The root of the tree would represent the most critical part of the ship, without which it will sink.  The leaves of the tree would represent the outermost armor.  

SORTS
When the game is finished, how well you did is seen on a leaderboard.  This leaderboard will use some kind of sort.  Your score would be determined by the sum of how many times you have hit the enemy (a positive integer) and how many times you have been hit (a negative integer).  Perhaps in a later version, we will have multiple leaderboards that will determine how well you did in certain aspects (i.e. defense, attack, overall).  The sort we are thinking of using is quicksort because of its efficiency, but if we run into any problems, we can easily implement a different algo.

PROCESSING
Graphics will be provided through processing.  We are planning to show images through processing.  The game will be in a top down perspective.  But if that fails then we have NTang’s lovely ascii art to fall back on.  
