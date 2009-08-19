import java.util.*;
import java.io.IOException;

public class PortfolioWithCollectionsTest extends Test
{
    Stock stockHP = new Stock("HPQ", 60.03, 120);
    Stock stockIBM = new Stock("IBM", 32.11, 50);
    Stock stockYHOO = new Stock("YHOO", 44.4, 180);

    public void testCollection()
    {
        Portfolio portfolio = new Portfolio();
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(stockHP);
        portfolio.addAsset(stockYHOO);

        Collection assets = portfolio.getAssets();
        assertTrue(assets.contains(stockIBM));
        assertTrue(assets.contains(stockHP));
        assertTrue(assets.contains(stockYHOO));
    }

    public void testGetByName()
    {
        Portfolio portfolio = new Portfolio();
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(stockHP);
        portfolio.addAsset(stockYHOO);

        assertEquals(stockIBM, portfolio.getAssetByName("IBM"));
        assertEquals(stockHP, portfolio.getAssetByName("HPQ"));
        assertEquals(stockYHOO, portfolio.getAssetByName("YHOO"));

        assertNull(portfolio.getAssetByName("QQQQ"));
    }

    public void testCompareByName()
    {
        StockNameComparator comparator = new StockNameComparator();
        assertTrue(comparator.compare(stockIBM, stockHP) > 0);
        assertEquals(0, comparator.compare(stockIBM, stockIBM));
        assertTrue(comparator.compare(stockIBM, stockYHOO) < 0);
    }

    public void testSortByName()
    {
        Portfolio portfolio = new Portfolio();
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(stockHP);
        portfolio.addAsset(stockYHOO);

        List assets = portfolio.getAssetsSortedByName();
        assertEquals(stockHP, assets.get(0));
        assertEquals(stockIBM, assets.get(1));
        assertEquals(stockYHOO, assets.get(2));
    }

    /**
     * the ValueComparator sorts in *descending* order of value
     * (most valuable comes first)
     */
    public void testCompareByValue()
    {
        StockValueComparator comparator = new StockValueComparator();
        assertTrue(comparator.compare(stockIBM, stockHP) > 0);  // less is more
        assertEquals(0, comparator.compare(stockIBM, stockIBM));
        assertTrue(comparator.compare(stockYHOO, stockHP) < 0);
    }

    public void testSortByValue()
    {
        Portfolio portfolio = new Portfolio();
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(stockHP);
        portfolio.addAsset(stockYHOO);

        List stocks = portfolio.getAssetsSortedByValue();
        assertEquals(stockYHOO, stocks.get(0));
        assertEquals(stockHP, stocks.get(1));
        assertEquals(stockIBM, stocks.get(2));
    }

    public void testReturnsImmutableCollection()
    {
        Portfolio portfolio = new Portfolio();
        portfolio.addAsset(stockIBM);
        portfolio.addAsset(stockHP);
        Collection assets = portfolio.getAssets();
        try {
            assets.add(stockYHOO);
            fail("Should have been unable to add an asset to the returned collection");
        }
        catch (Exception e) {
            // ok
        }
    }

}
