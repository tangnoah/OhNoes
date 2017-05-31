/*****************************************************
 * class ALHeap
 * Implements a min heap using an ArrayList as underlying container
 *****************************************************/

import java.util.ArrayList;

public class ALHeap 
{
    //instance vars
    private ArrayList<Integer> _heap; //underlying container is array of Integers

    /*****************************************************
     * default constructor  ---  inits empty heap
     *****************************************************/
    public ALHeap() 
    { 
	_heap = new ArrayList<Integer>();
    }
    public int get(int pos){
	return _heap.get(pos);
    }
    public int size(){
	return _heap.size();
    }


    /*****************************************************
     * toString()  ---  overrides inherited method
     * Returns either 
     * a) a level-order traversal of the tree (simple version)
     * b) ASCII representation of the tree (bit more complicated, much more fun)
     *****************************************************/
    public String toString() 
    { 
	//simple version:
	//return _heap.toString(); 

	//prettier version:
	String lvlOrdTrav = "heap size " + _heap.size() + "\n";

	if ( _heap.size() == 0 ) return lvlOrdTrav;

	int h = 1; //init height to 1
	for( int i = 0; i < _heap.size(); i++ ) {
	    lvlOrdTrav += i + ":" + _heap.get(i) + " ";
	    if ( i >= Math.pow(2,h) - 2 ) {
		lvlOrdTrav += "\n";
		h++;
	    }
	}
	return lvlOrdTrav;
    }//O(n)



    /*****************************************************
     * boolean isEmpty()
     * Returns true if no meaningful elements in heap, false otherwise
     *****************************************************/
    public boolean isEmpty() 
    { 
	return _heap.isEmpty(); 
    } //O(1)



    /*****************************************************
     * add(Integer) 
     * Inserts an element in the heap
     * Postcondition: Tree maintains heap property.
     * Algo: 
     * append new element to end of array, 
     * "walk up" to position where it belongs
     *****************************************************/
    public void add( Integer addVal ) 
    { 
	//Add value as last node, to maintain balance, completeness of tree
	_heap.add( addVal );

	int addValPos = _heap.size() - 1;
	int parentPos;

	while( addValPos > 0 ) { //potentially swap until reach root

	    //pinpoint parent
	    parentPos = (addValPos-1) / 2;

	    if ( addVal.compareTo(_heap.get(parentPos)) < 0 ) {//addVal < parent
		swap( addValPos, parentPos );
		addValPos = parentPos;
	    }
	    else 
		break;
		}
    } 

    //Sole purpose is for final project, purpose is to remove the maximum value in a heap (since we are working with levels, this will always work.

    public void removeMax(){
	_heap.remove(_heap.size()-1);
    }
  
    //swap for an ArrayList
    private void swap( int pos1, int pos2 ) 
    {
	_heap.set( pos1, _heap.set( pos2, _heap.get(pos1) ) );	
    }
    //********************************************
    


}//end class ALHeap