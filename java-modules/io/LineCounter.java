import java.io.*;

public class LineCounter
{
	public int countLines(String file) throws IOException
	{
		int lines = 0;
		BufferedReader in = new BufferedReader(new FileReader(file));
		while (in.readLine() != null)
		{
			++lines;
		}
		in.close();
		return lines;
	}
}