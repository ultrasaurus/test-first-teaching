
public class TransferTest extends Test
{
	public void testTransfer()
	{
		Account joseph = new Account("Joseph", 1000);
		Account mary = new Account("Mary", 500);
		
		Account.transfer(joseph, mary, 150);
		assertEquals(850, joseph.getBalance());
		assertEquals(650, mary.getBalance());
	}

	public void testTransferer() throws InterruptedException
	{
		Account joseph = new Account("Joseph", 1000);
		Account mary = new Account("Mary", 500);
		Thread transferer = new Transferer(joseph, mary, 50, 10);
		transferer.start();
		transferer.join();
		assertEquals(500, joseph.getBalance());
		assertEquals(1000, mary.getBalance());
	}
	
	public void testTransferThreadSafe() throws InterruptedException
	{
		Account joseph = new Account("Joseph", 1000);
		Account mary = new Account("Mary", 500);

		int REPS = 500000;
		Thread josephToMary = new Transferer(joseph, mary, 5, REPS);
		Thread maryToJoseph = new Transferer(mary, joseph, 5, REPS);

		josephToMary.start();
		maryToJoseph.start();
		
		josephToMary.join();
		maryToJoseph.join();
		
		assertEquals(1000, joseph.getBalance());
		assertEquals(500, mary.getBalance());
	}
}
