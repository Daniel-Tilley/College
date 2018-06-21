import java.io.*;
import java.net.*;
import java.util.*;

// This class represents a single server connection to the client and is used to handle server responses and send messages back to the server
// This class will also run as a background thread
public class ServerThread extends Thread{
	private Socket server;
	private Scanner input;
	private PrintWriter output;
	
	public ServerThread(Socket socket){
		server = socket;
		
		try {
            //Create input and output streams on the socket...
            input = new Scanner(server.getInputStream());
            output = new PrintWriter(server.getOutputStream(), true);
        } catch (IOException ioEx) {
            ioEx.printStackTrace();
        }
	}
	
	// Used to send input recieved from the client class to the server
	public void SendMessageToServer(String message){
		output.println(message);
	}
	
	public void run(){
		try {
            String response;
			
			// Run until the server has acknowlodged the clients request to "QUIT"
            do {
				response = input.nextLine();
				System.out.println("\nSERVER> " + response);
            } while (!response.equals("GOODBYE"));
        } catch (Exception ioEx) {
            ioEx.printStackTrace();
        } finally {
            closeConnection();
        }
	}
	
	// Used to close the connection, can be called from the Client class also
	public void closeConnection(){
		try {
            System.out.println("\nClosing connection...");
            server.close();
        } catch (IOException ioEx) {
            System.out.println("Unable to disconnect!");
			System.exit(1);
        }
	}
}