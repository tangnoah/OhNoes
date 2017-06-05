import java.util.ArrayList;

public class ArrayPriorityQueue<T> {

  ArrayList<T> PQueue;

  public ArrayPriorityQueue() {
    PQueue = new ArrayList<T>();
  }

  public void add (T x) {
    if (isEmpty() || ((Comparable)x).compareTo((Comparable)PQueue.get(0)) > 0) {
      PQueue.add(0,x);
    } else {
      for (int i = 0; i < PQueue.size(); i++) {
        if (((Comparable)x).compareTo((Comparable)PQueue.get(i)) >= 0) {
          PQueue.add(i, x);
          break;
        }
      }
      PQueue.add(PQueue.size(), x);
    }
  }

  public boolean isEmpty() {
    return PQueue.size() == 0;
  }

  public T peekMax() {
    return PQueue.get(0);
  }

  public T removeMax() {
    return PQueue.remove(0);
  }

  public String toString() {
    String retStr = "";
    for (int x = 0; x < PQueue.size(); x++) {
      retStr += PQueue.get(x) + ", ";
    }
    return retStr;
  }
}