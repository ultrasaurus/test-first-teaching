import java.io.*;

public class LineCountTest extends Test
{
	public void testLineCount() throws IOException
	{
		LineCounter counter = new LineCounter();
		assertEquals(10, counter.countLines("daysofxmas.txt"));
		
	}
	
}