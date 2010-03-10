
import java.io.*;

public class StreamTest extends Test
{
    public final String NEWLINE = System.getProperty("line.separator");

    public void testReadFile() throws IOException
    {
		String contents = IOUtil.readFile("odwalla.txt");
		assertEquals("This juice is food!", contents);
	}
	
	public void testWriteFile() throws IOException
    {
		String contents = "Drink it & thrive!";
		IOUtil.writeFile("odwalla2.txt", contents);
		assertEquals(contents, IOUtil.readFile("odwalla2.txt"));
	}

    public void testMultipleLines() throws IOException
    {
        StringBuffer buf = new StringBuffer();
        for (int i=0; i<100; ++i) {
            buf.append(i);
            buf.append(NEWLINE);
        }
        String string100 = buf.toString();

        String filename100 = "100.txt";

        IOUtil.writeFile(filename100, string100);
        String read = IOUtil.readFile(filename100);
        assertEquals(string100, read);

        new File(filename100).deleteOnExit();
    }
}
