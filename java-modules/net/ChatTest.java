
import java.net.*;
import java.io.*;
import java.util.*;

public class ChatTest extends Test
{
    public static String CHAT_HOST = "localhost";
    public static int CHAT_PORT = 7778;

    private PrintWriter openSocketWriter(Socket socket) throws IOException
    {
        PrintWriter out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
        return out;
    }

    private BufferedReader openSocketReader(Socket socket) throws IOException
    {
        return new BufferedReader(new InputStreamReader(socket.getInputStream()));
    }

    public void testConnect() throws Exception
    {
        ChatServer server = new ChatServer();
        server.start();
        Socket socket = new Socket(CHAT_HOST, CHAT_PORT);
        BufferedReader in = openSocketReader(socket);
        in.close();
        server.stopServer();
    }

    public void testEcho() throws Exception
    {
        ChatServer server = new ChatServer();
        server.start();
        Socket socket = new Socket(CHAT_HOST, CHAT_PORT);
        BufferedReader in = openSocketReader(socket);
        PrintWriter out = openSocketWriter(socket);
        out.println("Hello");
        out.flush();
        String line = in.readLine();
        assertEquals(line, "Hello");
        out.close();
        in.close();
        server.stopServer();
    }

    public void testEcho2() throws Exception
    {
        ChatServer server = new ChatServer();
        server.start();
        Socket socket = new Socket(CHAT_HOST, CHAT_PORT);
        BufferedReader in = openSocketReader(socket);
        PrintWriter out = openSocketWriter(socket);
        out.println("Hello");
        out.flush();
        out.println("Goodbye");
        out.flush();
        String line = in.readLine();
        assertEquals(line, "Hello");
        line = in.readLine();
        assertEquals(line, "Goodbye");
        out.close();
        in.close();
        server.stopServer();
    }

    public void testMany() throws Exception
    {
        ChatServer server = new ChatServer();
        server.start();
        Socket socketA = new Socket(CHAT_HOST, CHAT_PORT);
        Socket socketB = new Socket(CHAT_HOST, CHAT_PORT);
        Socket socketC = new Socket(CHAT_HOST, CHAT_PORT);
        PrintWriter out = openSocketWriter(socketA);
        String message = "Today is " + new Date();
        out.println(message);
        out.flush();

        Thread.sleep(2000); // wait for server to catch up

        BufferedReader in;
        String line;

        in = openSocketReader(socketA);
        line = in.readLine();
        assertEquals(line, message);

        in = openSocketReader(socketB);
        line = in.readLine();
        assertEquals(line, message);

        in = openSocketReader(socketC);
        line = in.readLine();
        assertEquals(line, message);
        server.stopServer();
    }

}
