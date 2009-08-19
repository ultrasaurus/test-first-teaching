public class Transferer extends Thread
{
	Account from;
	Account to;
	int amount;
	int reps;
	
	public Transferer(Account from, Account to, int amount, int reps)
	{
		this.from = from;
		this.to = to;
		this.amount = amount;
		this.reps = reps;
	}
	
	public void run()
	{
		for (int i=0; i<reps; ++i)
		{
			Account.transfer(from, to, amount);
		}
	}
}
