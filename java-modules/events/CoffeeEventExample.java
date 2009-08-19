
import java.util.*;

class CoffeeEvent
{
    private String blend;

    public CoffeeEvent(String blend)
    {
        this.blend = blend;
    }

    public String getBlend()
    {
        return blend;
    }
}

interface CoffeeListener
{
    public void coffeeIsReady(CoffeeEvent e);
}

class CoffeePot /* note: event source has nothing to implement */
{
    List listeners = new ArrayList();

    public void addCoffeeListener(CoffeeListener l)
    {
        listeners.add(l);
    }

    public void brewCoffee(String blend)
    {
        System.out.println("perk... perk...");
        CoffeeEvent e = new CoffeeEvent(blend);
        System.out.println("Ready!");
        Iterator i = listeners.iterator();
        while (i.hasNext())
        {
            CoffeeListener listener =
                (CoffeeListener)i.next();
            listener.coffeeIsReady(e);
        }
    }
}

class Alex implements CoffeeListener
{
    public Alex()
    {
        CoffeePot pot = new CoffeePot();
        pot.addCoffeeListener(this);
        pot.brewCoffee("Guatemala");
    }

    public void coffeeIsReady(CoffeeEvent e)
    {
        System.out.println("Mmm! I love " + e.getBlend());
    }
}
