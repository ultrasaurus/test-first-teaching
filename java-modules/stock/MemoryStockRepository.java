
import java.util.*;
import java.io.IOException;

public class MemoryStockRepository implements StockRepository
{
    private Map contents = new HashMap();
    private int nextId = 1;

    public MemoryStockRepository() throws IOException
    {
    }

    synchronized public void clear() throws IOException
    {
        contents = new HashMap();
        nextId = 1;
    }

    public void close() throws IOException
    {
    }

    public int countStocks() throws IOException
    {
        return contents.size();
    }

    public Stock createStock(String symbol, double pricePerShare, int numShares) throws IOException
    {
        Stock Stock = new Stock(nextId(), symbol, pricePerShare, numShares);
        saveStock(Stock);
        return Stock;
    }

    public synchronized int nextId()
    {
        return nextId++;
    }

    public void saveStock(Stock stock) throws IOException
    {
        if (stock.getId() == 0)
        {
            stock.setId(nextId());
        }
        contents.put(new Long(stock.getId()), stock);
    }

    public Stock loadStock(long id) throws IOException
    {
        return (Stock) contents.get(new Long(id));
    }

    public List findAllStocks() throws IOException
    {
        return Collections.unmodifiableList(new ArrayList(contents.values()));
    }
}
