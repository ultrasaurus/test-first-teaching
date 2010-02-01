public class Depositor extends Thread
{
	private Account account;
	private int amountPerDeposit;
	private int numberOfDeposits;
    private int count;

	public Depositor(Account account, int amount, int reps)
	{
		this.account = account;
		this.amountPerDeposit = amount;
		this.numberOfDeposits = reps;
	}
	
	public void run()
	{
		for (count=0; count<numberOfDeposits; ++count)
		{
			account.deposit(amountPerDeposit);
		}
	}

    public int getCount()
    {
        return count;
    }

    public int getAmountPerDeposit()
    {
        return amountPerDeposit;
    }

    public int getNumberOfDeposits()
    {
        return numberOfDeposits;
    }
}