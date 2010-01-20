
public class ThreadTest extends Test
{
    public void testAccountConstructor()
    {
        Account account = new Account("Joe", 100);
        assertEquals(100, account.getBalance());
        assertEquals("Joe", account.getName());
    }

    public void testDeposit()
    {
        Account account = new Account("Joe", 100);
        account.deposit(50);
        assertEquals(150, account.getBalance());
    }

    public void testWithdraw()
    {
        Account account = new Account("Joe", 100);
        account.withdraw(25);
        assertEquals(75, account.getBalance());
    }

    public void testDepositor() throws InterruptedException
    {
        Account account = new Account("Joe", 0);
        Depositor depositor = new Depositor(account, 2, 1000);
        assertTrue(depositor instanceof Thread);
        assertEquals(2, depositor.getAmountPerDeposit());
        assertEquals(1000, depositor.getNumberOfDeposits());

        depositor.start();
        depositor.join();
        assertEquals(2000, account.getBalance());
    }

    public void testDepositorReturnsCount() throws InterruptedException
    {
        Account account = new Account("Joe", 0);
        Depositor depositor = new Depositor(account, 1, 1000);
        depositor.start();
        depositor.join();
        assertEquals(1000, depositor.getCount());
    }

    public void testDepositorIsAsynchronous() throws InterruptedException
    {
        Account account = new Account("Joe", 0);
        //note: increase this until it *works* on your CPU.
        //A Pentium 4 1.6GHz needs 100,000,000 or so.
        int reps = 1000000;
        Depositor depositor = new Depositor(account, 1, reps);

        // we start a depositor...
        depositor.start();
        // wait until it has started incrementing...
        while (depositor.getCount() == 0)
        {
            Thread.yield();
        }
        // and make sure it hasn't gone all the way yet.
        assertTrue(depositor.getCount() < reps);
        depositor.join();
    }

    public void testThreadSafe() throws InterruptedException
    {
        int DEPOSITORS = 50;
        int AMOUNT = 2;
        // note: increase this value until it *fails* on your CPU.
        // Then fix it.
        int REPS = 25000;
        Account account = new Account("Joe", 0);
        Thread[] depositors = new Thread[DEPOSITORS];
        for (int i=0; i< DEPOSITORS; ++i) {
            depositors[i] = new Depositor(account, AMOUNT, REPS);
            depositors[i].start();
        }
        for (int i=0; i< DEPOSITORS; ++i) {
            depositors[i].join();
        }
        assertEquals(REPS * DEPOSITORS * AMOUNT, account.getBalance());
    }
}
