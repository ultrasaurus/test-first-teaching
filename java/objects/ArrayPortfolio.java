
public class ArrayPortfolio
{
    Asset[] contents;
    int c;

    public ArrayPortfolio()
    {
        contents = new Asset[10];
        c = 0;
    }

    public ArrayPortfolio(Asset[] assets)
    {
        this.contents = assets;
        this.c = assets.length;
    }

    public void addAsset(Asset asset)
    {
        contents[c++] = asset;
        // todo: range check
    }

    public double getTotalValue()
    {
        double total = 0;
        for (int i=0; i<c; ++i)
        {
            total += contents[i].getValue();
        }
        return total;

    }

    public static double totalValue(Asset[] assets)
    {
        return new ArrayPortfolio(assets).getTotalValue();
    }

}
