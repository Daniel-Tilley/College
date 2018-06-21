import java.io.*;
import java.net.*;
import java.util.*;

// This class represents a single client connection on the server and is used to handle client requests and print messages back to the client
// This class will also run as a background thread
class ClientThread extends Thread {
    private Socket client;
    private Scanner input;
    private PrintWriter output;
	private AuctionHandler auctionHandler; // reference to the auction handler thread so that bids can be sent to it

    public ClientThread(Socket socket, AuctionHandler auctionHandler) {
        client = socket;
		this.auctionHandler = auctionHandler;
		
        try {
            //Create input and output streams on the socket...
            input = new Scanner(client.getInputStream());
            output = new PrintWriter(client.getOutputStream(), true);
        } catch (IOException ioEx) {
            ioEx.printStackTrace();
        }
		
		// Get a pre defined welcome message from the Auction class and send to the client
		// This will contain details like current item name and price
		SendMessageToClient(auctionHandler.GetAuctionDetails().GetWelcomeMessage());
    }
	
	// Used to output a message to the client
	public void SendMessageToClient(String message){
		output.println(message);
	}
	
    public void run() {
        String request = "";
		
		// Handle the requests until the client wants to "QUIT"
        do {
            request = input.nextLine();
            
			if (!request.equals("QUIT")){
				// Send the clients bid to the auction handler
				auctionHandler.ProcessBid(request, this);
			}
			else{
				SendMessageToClient("GOODBYE");
			}
        } while (!request.equals("QUIT"));

        try {
            System.out.println("Closing down connection...");
			client.close();
        } catch (IOException ioEx) {
            System.out.println("Unable to close connection to client!");
        }
    }
}
