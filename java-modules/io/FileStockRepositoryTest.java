
import java.io.*;

public class FileStockRepositoryTest extends Test
{
    Stock hp = new Stock("HP", 11.4, 10);
    Stock yhoo = new Stock("YHOO", 57.2, 30);
    private File repositoryDir = new File("mydata");

    public void testStockId()
    {
        assertEquals(0, hp.getId());
        hp.setId(123);
        assertEquals(123, hp.getId());
    }

    public void testNextId() throws Exception
    {
        FileStockRepository repository = new FileStockRepository(repositoryDir);
        long id1 = repository.nextId();
        assertTrue( id1 != 0 );
        long id2 = repository.nextId();
        assertTrue( id2 != 0);
        assertTrue( id2 != id1 );

    }

    public void testCreateRepository() throws Exception
    {
        FileStockRepository repository;
        repository = new FileStockRepository(repositoryDir);
        assertTrue(repositoryDir.exists());
        assertTrue(repositoryDir.isDirectory());
    }

    public void testStockFileName() throws Exception
    {
        FileStockRepository repository = new FileStockRepository(repositoryDir);
        assertEquals("stock123.txt", repository.stockFileName(123));
        hp.setId(456);
        assertEquals("stock456.txt", repository.stockFileName(hp));
    }

    public void testSaveStockWritesToFile() throws Exception
    {
        FileStockRepository repository = new FileStockRepository(repositoryDir);
        repository.saveStock(yhoo);
        assertFalse(yhoo.getId() == 0);
        File fileYhoo = new File(repositoryDir, repository.stockFileName(yhoo));
        assertTrue(fileYhoo.exists());
    }

    public void testSaveAndLoad() throws Exception
    {
        FileStockRepository repository = new FileStockRepository(repositoryDir);
        repository.saveStock(yhoo);
        long id = yhoo.getId();

        FileStockRepository differentRepository = new FileStockRepository(repositoryDir);
        Stock newYhoo = differentRepository.loadStock(id);

        assertEquals(yhoo, newYhoo);
    }

    public void testSaveAfterChange() throws Exception
    {
        FileStockRepository repository = new FileStockRepository(repositoryDir);
        repository.saveStock(yhoo);
        yhoo.setNumShares(120);
        repository.saveStock(yhoo);

        FileStockRepository newRepository = new FileStockRepository(repositoryDir);
        Stock loaded = newRepository.loadStock(yhoo.getId());
        assertEquals(120, loaded.getNumShares());
    }
}
