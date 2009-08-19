
import java.io.File;
import java.util.List;

//todo: remove duplication between this test and FileStockRepositoryTest somehow

public class MemoryStockRepositoryTest extends Test
{
    Stock hp = new Stock("HP", 11.4, 10);
    Stock yhoo = new Stock("YHOO", 57.2, 30);

    public void testStockId()
    {
        assertEquals(0, hp.getId());
        hp.setId(123);
        assertEquals(123, hp.getId());
    }

    public void testNextId() throws Exception
    {
        MemoryStockRepository repository = new MemoryStockRepository();
        long id1 = repository.nextId();
        assertTrue(id1 != 0);
        long id2 = repository.nextId();
        assertTrue(id2 != 0);
        assertTrue(id2 != id1);
    }

    public void testSaveAndLoad() throws Exception
    {
        MemoryStockRepository repository = new MemoryStockRepository();
        repository.saveStock(yhoo);
        long id = yhoo.getId();
        Stock loaded = repository.loadStock(id);
        assertEquals(yhoo, loaded);
    }

    public void testSaveAfterChange() throws Exception
    {
        MemoryStockRepository repository = new MemoryStockRepository();
        repository.saveStock(yhoo);
        yhoo.setNumShares(120);
        repository.saveStock(yhoo);
        Stock loaded = repository.loadStock(yhoo.getId());
        assertEquals(120, loaded.getNumShares());
    }

    public void testFindAllStocks() throws Exception
    {
        MemoryStockRepository repository = new MemoryStockRepository();
        List stocks;
        stocks = repository.findAllStocks();
        assertTrue(stocks.isEmpty());

        repository.saveStock(yhoo);
        stocks = repository.findAllStocks();
        assertEquals(1, stocks.size());

        repository.saveStock(hp);
        stocks = repository.findAllStocks();
        assertEquals(2, stocks.size());
    }

    public void testClear() throws Exception
    {
        MemoryStockRepository repository = new MemoryStockRepository();
        repository.saveStock(yhoo);
        repository.saveStock(hp);
        repository.clear();
        List stocks;
        stocks = repository.findAllStocks();
        assertTrue(stocks.isEmpty());
    }
}
