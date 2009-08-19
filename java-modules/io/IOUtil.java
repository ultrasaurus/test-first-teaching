
import java.io.*;

public class IOUtil
{
    public static String readFile(String filename) throws IOException
    {
        FileReader filereader = null;
        String s = null;
        try
        {
            filereader = new FileReader(new File(filename));
            s = readReader(filereader);
        }
        finally
        {
            if (filereader != null)
                filereader.close();
        }
        return s;
    }

    public static String readReader(Reader input) throws IOException
    {
        try
        {
            StringBuffer buf = new StringBuffer();
            BufferedReader in = new BufferedReader(input);
            int ch;
            while ((ch = in.read()) != -1)
                buf.append((char) ch);
            return buf.toString();
        }
        finally
        {
            input.close();
        }

    }

    public static void writeFile(String filename, String data) throws IOException
    {
        File outFile = new File(filename);
        InputStream in = null;
        OutputStream out = null;
        try
        {
            in = new BufferedInputStream(new ByteArrayInputStream(data.getBytes()));
            out = new BufferedOutputStream(new FileOutputStream(outFile));
            int ch;
            while ((ch = in.read()) != -1)
            {
                out.write(ch);
            }
        }
        finally
        {
            try
            {
                if (out != null) out.close();
                if (in != null) in.close();
            }
            catch (Exception e)
            {
            }
        }
    } // writeFile

}
