
import java.io.*;
import java.util.List;

public interface StockRepository
{
    public void clear() throws IOException;
    public int countStocks() throws IOException;
    public Stock createStock(String symbol, double pricePerShare, int numShares) throws IOException;
    public void saveStock(Stock stock) throws IOException;
    public Stock loadStock(long id) throws IOException;
    public List findAllStocks() throws IOException;
    public void close() throws IOException;
}
