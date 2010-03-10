
import java.net.*;
import java.io.*;
import java.util.*;

public class ChatServer extends Thread
{
    private int CHAT_PORT = 7778;

    private List clients = new ArrayList();
    private ServerSocket ss;
    private boolean doStop;

    public static void main(String[] args) throws IOException
    {
        new ChatServer().start();
    }

    public void run()
    {
        try
        {
            ss = new ServerSocket(CHAT_PORT);
            while (!doStop)
            {
                Socket client = ss.accept();
                System.out.println("accepted " + client);
                Client c = new Client(client);
                addClient(c);
                c.start();
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        try
        {
            if (ss != null)
               ss.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    public synchronized void stopServer() {
        this.doStop = true;
    }

    synchronized private void addClient(Client c)
    {
        clients.add(c);
    }

    synchronized private void sendToAllClients(String line)
    {
        for (Iterator iterator = clients.iterator(); iterator.hasNext();)
        {
            Client client = (Client) iterator.next();
            client.send(line);
        }
    }

    synchronized private void removeClient(Client client)
    {
        clients.remove(client);
    }

    class Client extends Thread
    {
        private Socket socket;
        private PrintWriter out;
        private BufferedReader in;

        public Client(Socket socket) throws IOException
        {
            this.socket = socket;
            this.out = openSocketWriter(socket);
            this.in = openSocketReader(socket);
        }

        public void run()
        {
            String line;
            try
            {
                while ((line = in.readLine()) != null)
                {
                    System.out.println("received '" + line + "'");
                    sendToAllClients(line);
                }
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
            finally
            {
                try
                {
                    socket.close();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
                removeClient(this);
            }
        }

        private PrintWriter openSocketWriter(Socket socket) throws IOException
        {
            PrintWriter out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
            return out;
        }

        private BufferedReader openSocketReader(Socket socket) throws IOException
        {
            return new BufferedReader(new InputStreamReader(socket.getInputStream()));
        }

        public void send(String line)
        {
            System.out.println("sending line '" + line + "' to " + socket);
            out.println(line);
            out.flush();
        }
    }
}
