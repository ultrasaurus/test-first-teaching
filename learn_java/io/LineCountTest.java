import junit.framework.TestCase;
import java.io.*;

public class LineCountTest extends TestCase
{
	public void testLineCount() throws IOException
	{
		LineCounter counter = new LineCounter();
		assertEquals(10, counter.countLines("daysofxmas.txt"));

	}

}
