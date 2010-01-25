
public class Stock implements Asset
{
    private long id;
    private String symbol;
    private double pricePerShare;
    private int numShares;

    public Stock()
    {
    }

    public Stock(String symbol, double pricePerShare, int numShares)
    {
        this.symbol = symbol;
        this.pricePerShare = pricePerShare;
        this.numShares = numShares;
    }

    public Stock(long id, String symbol, double pricePerShare, int numShares)
    {
        this.id = id;
        this.symbol = symbol;
        this.pricePerShare = pricePerShare;
        this.numShares = numShares;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getSymbol()
    {
        return symbol;
    }

    public void setSymbol(String symbol)
    {
        this.symbol = symbol;
    }

    public double getPricePerShare()
    {
        return pricePerShare;
    }

    public void setPricePerShare(double pricePerShare)
    {
        this.pricePerShare = pricePerShare;
    }

    public int getNumShares()
    {
        return numShares;
    }

    public void setNumShares(int numShares)
    {
        this.numShares = numShares;
    }

    public String getName()
    {
        return symbol;
    }

    public double getValue()
    {
        return (double) numShares * pricePerShare;
    }

    public static double totalValue(Asset[] stocks)
    {
        double total = 0;
        for (int i = 0; i < stocks.length; ++i)
        {
            total += stocks[i].getValue();
        }
        return total;
    }

    public boolean equals(Object o)
    {
        Stock other = (Stock) o;
        return (other.symbol.equals(symbol) &&
                other.pricePerShare == pricePerShare &&
                other.numShares == numShares);
    }

    public String toString()
    {
        return "Stock[symbol=" + symbol + ",pricePerShare=" + pricePerShare + ",numShares=" + numShares + "]";
    }

}
