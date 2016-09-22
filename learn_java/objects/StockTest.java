import junit.framework.TestCase;

public class StockTest extends TestCase
{
    public void testSetSymbol()
    {
        Stock s = new Stock();
        s.setSymbol("MSFT");

        System.out.print("STOCK IS: ");
        System.out.println(s);

        assertEquals("MSFT", s.getSymbol());
    }

    public void testSetPrice()
    {
        Stock s = new Stock();
        s.setSymbol("MSFT");
        s.setPricePerShare(56.67);

        assertEquals(56.67, s.getPricePerShare());
    }

    public void testSetNumShares()
    {
        Stock s = new Stock();
        s.setSymbol("MSFT");
        s.setPricePerShare(56.67);
        s.setNumShares(100);

        assertEquals(100, s.getNumShares());
        assertEquals(5667, s.getValue());
    }

    public void testMultiArgumentConstructor()
    {
        Stock stockYHOO = new Stock("YHOO", 43.33, 60);

        assertEquals("YHOO", stockYHOO.getSymbol());
        assertEquals(43.33, stockYHOO.getPricePerShare());
        assertEquals(60, stockYHOO.getNumShares());
        assertEquals(43.33 * 60, stockYHOO.getValue());
    }

    public void testMultipleInstances()
    {
        Stock stockYHOO = new Stock("YHOO", 10, 100);
        Stock stockMSFT = new Stock("MSFT", 22, 300);
        assertEquals(1000, stockYHOO.getValue());
        assertEquals(6600, stockMSFT.getValue());
    }

    public void testTotalValue()
    {
        Stock stockHP = new Stock("HPQ", 60.03, 120);
        Stock stockIBM = new Stock("IBM", 32.11, 50);

        Stock[] stocks = new Stock[2];
        stocks[0] = stockHP;
        stocks[1] = stockIBM;

        assertEquals( 8809.1, Stock.totalValue(stocks) );
    }

    public void testToString()
    {
        Stock stockABC = new Stock("ABC", 12.23, 50);

        assertEquals("Stock[symbol=ABC,pricePerShare=12.23,numShares=50]",
                     stockABC.toString());
    }

    public void testEquals()
    {
        Stock abc1 = new Stock("ABC", 12.23, 50);
        Stock abc2 = new Stock("ABC", 12.23, 50);

        assertTrue(abc1.equals(abc2));
        assertTrue(abc2.equals(abc1));
    }

    public void testNotEquals()
    {
        Stock stock1 = new Stock("ABC", 12.23, 50);
        Stock stock2 = new Stock("XYZ", 12.23, 50);
        Stock stock3 = new Stock("ABC", 45.67, 50);
        Stock stock4 = new Stock("ABC", 12.23, 60);

        assertTrue(!stock1.equals(stock2));
        assertTrue(!stock1.equals(stock3));
        assertTrue(!stock1.equals(stock4));
    }

}
