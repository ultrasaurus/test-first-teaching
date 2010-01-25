import java.util.*;

public class Portfolio
{
    List assets;
    Map index = new HashMap();

    public Portfolio()
    {
        assets = new ArrayList();
    }

    public Portfolio(Asset[] assets)
    {
        this.assets = Arrays.asList(assets);
    }

    public void addAsset(Asset instrument)
    {
        assets.add(instrument);
        index.put(instrument.getName(), instrument);
    }

    public List getAssets()
    {
        return Collections.unmodifiableList(assets);
    }

    public List getAssetsSortedByName()
    {
        Collections.sort(assets, new StockNameComparator());
        return getAssets();
    }

    public List getAssetsSortedByValue()
    {
        Collections.sort(assets, new StockValueComparator());
        return getAssets();
    }

    public Asset getAssetByName(String name)
    {
        return (Asset) index.get(name);
    }

    public double totalValue()
    {
        double total = 0;
        for (int i = 0; i < assets.size(); ++i)
        {
            total += ((Asset) assets.get(i)).getValue();
        }
        return total;
    }

    public static double totalValue(Asset[] instruments)
    {
        return new Portfolio(instruments).totalValue();
    }

}
