
import java.io.File;
import java.io.IOException;

public class FileStockRepository
{
    private File directory;
    private long nextId = 1;

    public FileStockRepository(File directory)
    {
        if (!directory.exists()) {
            directory.mkdirs();
        }
        this.directory = directory;
    }

    public String stockFileName(Stock stock)
    {
        return stockFileName(stock.getId());
    }

    public String stockFileName(long id)
    {
        return "stock" + id + ".txt";
    }

    public void saveStock(Stock stock) throws IOException
    {
        if (stock.getId() == 0) {
            stock.setId(nextId());
        }
        File file = stockFile(stock);
        new StockIO().writeStock(file, stock);
    }

    private File stockFile(Stock stock)
    {
        File file = stockFile(stock.getId());
        return file;
    }

    private File stockFile(long id)
    {
        File file = new File(directory, stockFileName(id));
        return file;
    }

    public Stock loadStock(long id) throws IOException
    {
        return new StockIO().readStock(stockFile(id));
    }

    public long nextId()
    {
        return nextId++;
    }
}
