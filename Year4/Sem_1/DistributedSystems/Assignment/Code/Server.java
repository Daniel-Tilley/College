import java.io.*;
import java.net.*;
import java.util.*;

// This class is responsible for running the server and for setting up any nesessary handlers for the client and auction
public class Server
{
	private static ServerSocket servSocket;
	private static final int PORT = 1234;
	public static ArrayList<ClientThread> connectedClients = new ArrayList<ClientThread>(); // Array list to store all connected clients

	public static void main(String[] args) throws IOException
	{
		// Try to create the host socket
		try
		{
			System.out.println("\nSetting up port...");
			servSocket = new ServerSocket(PORT);
		}
		catch (IOException ioEx)
		{
			System.out.println("\nUnable to set up port!");
			System.exit(1);
		}
		
		// Create the auction handler which will run in the background as a thread
		System.out.println("\nCreating new auction handler");
		AuctionHandler auctionHandler = new AuctionHandler();
		auctionHandler.start();
		
		do
		{
			//Wait for a client to make connection...
			Socket client = servSocket.accept();
			System.out.println("\nNew client accepted.\n");
			
			// Start the client thread in the background to deal with incoming requests and print messages to the user
			ClientThread clientHandler = new ClientThread(client, auctionHandler);
			clientHandler.start();
			
			// Add the newly connected client to the list and pass it to the auction handler
			connectedClients.add(clientHandler);
			auctionHandler.SetConnectedClients(connectedClients);
		}while (true);
	}
}
