import java.io.*;
import java.net.*;
import java.util.*;

// This class is used to run the client and accept keyboard input from the user
public class Client {
    private static InetAddress host;
    private static final int PORT = 1234;
	private static Socket socket;
	private static ServerThread serverThread; 

    public static void main(String[] args) {
		// Create new socket and server thread for dealing with incoming messages from the server
        try {
            host = InetAddress.getLocalHost();
			socket = new Socket(host, PORT);
			
			serverThread = new ServerThread(socket);
			serverThread.start();
        } catch (UnknownHostException uhEx) {
            System.out.println("\nHost ID not found!\n");
            System.exit(1);
        }catch (IOException ioEx){
			System.out.println("\nUnable to set up port!");
			System.exit(1);
		}
		
        sendMessages();
    }

    private static void sendMessages() {
        try {
			System.out.println("\n*** ENTER A BID BELOW |---| ENTER 'QUIT' TO EXIT ***");
			
            //Set up stream for keyboard entry...
            Scanner userEntry = new Scanner(System.in);
            String message;
			
			// Handle user input from keyboard until the user wishes to "QUIT"
            do {
                message = userEntry.nextLine();
				serverThread.SendMessageToServer(message);
            } while (!message.equals("QUIT"));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			serverThread.closeConnection(); // Close connection after any errors are caught
        }
    }
}
