import java.util.*;

public class StockNameComparator implements Comparator
{
    public int compare(Object a, Object b) {
	return ((Asset)a).getName().compareTo(((Asset)b).getName());
    }
}
