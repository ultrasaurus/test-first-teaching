
import java.io.*;

public class StockIOTest extends Test
{
    Stock hp = new Stock("HP", 11.4, 10);
    Stock yhoo = new Stock("YHOO", 57.2, 30);
    private String NL = System.getProperty("line.separator");

    public void testWriteToWriterHp() throws IOException
    {
        StockIO io = new StockIO();
        StringWriter sw = new StringWriter();
        io.writeStock(sw, hp);
        assertEquals("HP" + NL + "11.4" + NL + "10" + NL, sw.toString());
    }

    public void testWriteStockYahoo() throws IOException
    {
        StockIO io = new StockIO();
        StringWriter sw = new StringWriter();
        io.writeStock(sw, yhoo);
        assertEquals("YHOO" + NL + "57.2" + NL + "30" + NL, sw.toString());
    }

    public void testReadStock() throws IOException
    {
        StockIO io = new StockIO();

        String hpData = "HP" + NL + "11.4" + NL + "10" + NL;
        String yhooData = "YHOO" + NL + "57.2" + NL + "30" + NL;

        Reader data = new StringReader(hpData);
        Stock loaded = io.readStock(data);
        assertEquals(hp, loaded);

        data = new StringReader(yhooData);
        loaded = io.readStock(data);
        assertEquals(yhoo, loaded);
    }


    public void testWriteToFile() throws Exception
    {
        File output = new File("stockout.txt");
        try
        {
            StockIO io = new StockIO();
            io.writeStock(output, hp);
            assertTrue(output.exists());
            Stock loaded = io.readStock(output);
            assertEquals(hp, loaded);
        }
        finally
        {
            output.deleteOnExit();
        }
    }

}
