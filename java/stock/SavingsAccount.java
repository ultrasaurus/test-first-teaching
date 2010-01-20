
public class SavingsAccount implements Asset
{
    private String name;
    private double value;
    private double interestRate;

    public SavingsAccount(String name, int value, double interestRate)
    {
        this.name = name;
        this.value = value;
        this.interestRate = interestRate;
    }

    public String getName()
    {
        return name;
    }

    public double getValue()
    {
        return value;
    }

    public double getInterestRate()
    {
        return interestRate;
    }

    public void applyInterest() 
    {
	value += ((interestRate/100.0) * value);
    }

    public String toString()
    {
        return "SavingsAccount[value=" + value + ",interestRate=" + interestRate + "]";
    }
}
