import junit.framework.TestCase;
public class PortfolioTest extends TestCase
{
    Stock stockHP = new Stock("HPQ", 60.03, 120);
    Stock stockIBM = new Stock("IBM", 32.11, 50);
    SavingsAccount cd1000 = new SavingsAccount("Account 556677", 1000, 4.5);

    public void testArrayConstructor()
    {
        Stock[] stocks = { stockHP, stockIBM };
        ArrayPortfolio portfolio = new ArrayPortfolio(stocks);
        assertEquals( 8809.1, portfolio.getTotalValue() );
    }

    public void testAdd()
    {
        ArrayPortfolio portfolio = new ArrayPortfolio();
        portfolio.addAsset(stockHP);
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(cd1000);
        assertEquals(9809.1, portfolio.getTotalValue() );
    }

}
