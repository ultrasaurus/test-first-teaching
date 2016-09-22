import junit.framework.TestCase;
public class PolymorphismTest extends TestCase
{
    Stock stockHP = new Stock("HPQ", 60.03, 120);
    Stock stockIBM = new Stock("IBM", 32.11, 50);

    public void testInstanceOf()
    {
        assertTrue(stockHP instanceof Asset);
    }

    public void testCD()
    {
        SavingsAccount cd = new SavingsAccount("Account 55555", 1000, 4.2);
        assertTrue(cd instanceof Asset);
        assertEquals("SavingsAccount[value=1000.0,interestRate=4.2]", cd.toString());
        assertEquals(1000, cd.getValue());
        assertEquals(4.2, cd.getInterestRate());
    }

    public void testCDInterest()
    {
        SavingsAccount cd = new SavingsAccount("Account 55555", 1000, 4.2);
        assertEquals(1000, cd.getValue());
        cd.applyInterest();
	assertEquals(1042, cd.getValue());
    }

    public void testPolymorphismArray()
    {
        SavingsAccount cd = new SavingsAccount("Account 55555", 1000, 3.2);

        Asset[] portfolio = new Asset[3];
        portfolio[0] = stockHP;
        portfolio[1] = stockIBM;
        portfolio[2] = cd;
        assertEquals( 9809.1, Stock.totalValue(portfolio) );
    }
}
