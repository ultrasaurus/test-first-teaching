
public class Account
{
    private String name;
    private int balance;

    public Account(String name, int balance)
    {
        this.name = name;
        this.balance = balance;
    }

    public String getName()
    {
        return name;
    }

    public int getBalance()
    {
        return balance;
    }

    synchronized public void deposit(int amount)
    {
        int newbalance = balance;
        newbalance += amount;
        balance = newbalance;
    }

    synchronized public void withdraw(int amount)
    {
        balance = balance - amount;
    }

    public static void transfer(Account from, Account to, int amount)
    {
        from.withdraw(amount);
        to.deposit(amount);
    }
}

