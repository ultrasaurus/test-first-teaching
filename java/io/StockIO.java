
import java.io.*;

public class StockIO
{
    public void writeStock(Writer out, Stock stock) throws IOException
    {
        PrintWriter pw = new PrintWriter(out);
        pw.println(stock.getSymbol());
        pw.println(stock.getPricePerShare());
        pw.println(stock.getNumShares());

    }

    public Stock readStock(Reader in) throws IOException
    {
        BufferedReader lines = new BufferedReader(in);
        String symbol = lines.readLine();
        double price = Double.parseDouble(lines.readLine());
        int numShares = Integer.parseInt(lines.readLine());
        return new Stock(symbol, price, numShares);
    }

    public void writeStock(File file, Stock stock) throws IOException
    {
        FileWriter out = new FileWriter(file);
        writeStock(out, stock);
        out.close();  // todo: finally
    }

    public Stock readStock(File file) throws IOException
    {
        FileReader in = new FileReader(file);
        Stock stock = readStock(in);
        in.close(); // todo: finally
        return stock;
    }
}
