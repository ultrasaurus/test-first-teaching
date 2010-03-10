
import java.util.*;

public class StockValueComparator implements Comparator
{
    public int compare(Object a, Object b)
    {
        double aVal = ((Asset) a).getValue();
        double bVal = ((Asset) b).getValue();
        if (aVal == bVal) return 0;
        if (aVal > bVal) return -1;
        return 1;
    }
}
