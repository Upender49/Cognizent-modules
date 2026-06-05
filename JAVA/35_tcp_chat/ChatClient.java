import java.io.*;
import java.net.*;

public class ChatClient {
    public static void main(String[] args) throws IOException {
        try (Socket socket = new Socket("localhost", 5000);
             BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader user = new BufferedReader(new InputStreamReader(System.in))) {

            String msg;
            while ((msg = user.readLine()) != null) {
                out.println(msg);
                System.out.println(in.readLine());
            }
        }
    }
}
