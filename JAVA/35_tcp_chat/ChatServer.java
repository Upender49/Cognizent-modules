import java.io.*;
import java.net.*;
import java.util.concurrent.*;

public class ChatServer {
    public static void main(String[] args) throws IOException {
        ExecutorService pool = Executors.newFixedThreadPool(10);
        try (ServerSocket server = new ServerSocket(5000)) {
            System.out.println("Server started...");
            while (true) {
                Socket client = server.accept();
                pool.execute(() -> handleClient(client));
            }
        }
    }

    static void handleClient(Socket client) {
        try (BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
             PrintWriter out = new PrintWriter(client.getOutputStream(), true)) {
            String msg;
            while ((msg = in.readLine()) != null) {
                System.out.println("Client: " + msg);
                out.println("Echo: " + msg);
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
