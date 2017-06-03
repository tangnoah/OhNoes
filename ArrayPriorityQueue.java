import java.util.ArrayList;
    
public class ArrayPriorityQueue<T> {
    
    ArrayList<T> PQueue;
    
    public ArrayPriorityQueue(){
	PQueue = new ArrayList<T>();
    }

    public void add (T x){
	if (isEmpty() ||((Comparable)x).compareTo((Comparable)PQueue.get(PQueue.size() - 1)) < 0){
	    PQueue.add(x);
	}
	else{
	    for (int i = 0; i < PQueue.size(); i++){
		if (((Comparable)x).compareTo((Comparable)PQueue.get(i)) >= 0){
		    PQueue.add(i, x);
		    break;
		}
	    }
	}
    }

    public boolean isEmpty(){
	return PQueue.size() == 0;
    }

    public T peekMin(){
	return PQueue.get(PQueue.size() - 1);
    }

    public T removeMin(){
	return PQueue.remove(PQueue.size() - 1);
	
    }

    public String toString(){
	String retStr = "";
	for (int x = 0; x < PQueue.size(); x++){
	    retStr += PQueue.get(x) + ", ";
	}
	return retStr;
    }	
}