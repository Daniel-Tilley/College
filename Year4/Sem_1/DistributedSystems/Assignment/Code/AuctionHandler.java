import java.io.*;
import java.net.*;
import java.util.*;

// This is the most important class in the applocation.
// It is in charge of handeling the auction process such as bids and items to sell.
public class AuctionHandler extends Thread{
	private Auction auction; // Auction model
	private ArrayList<Item> itemsToSell = new ArrayList<Item>(); // List of items to sell
	private ArrayList<Item> itemsToReSell = new ArrayList<Item>(); // list of items to re sell if they are not sold
	private ArrayList<ClientThread> connectedClients; // List of connected clients (used for printing messages to clients)
	
	public AuctionHandler(){
		// Create a new auction model and get the items to sell
		auction = new Auction();
		itemsToSell = auction.GetItemsToSell();
	}
	
	public void run(){
		// Wait for atleat one client to connect before starting the auction
		while(connectedClients == null){
			try{
				// Pause the thread every half a second
				Thread.sleep(500);
			}catch(InterruptedException ie){
				ie.printStackTrace();
			}
		}
		
		// Loop through the items to sell while the list is not empty
		while(!itemsToSell.isEmpty()){
			// Loop through the list
			for(int i = 0 ; i < itemsToSell.size() ; i++){
				// Set the curent item to sell in the model class
				auction.SetCurrentItem(itemsToSell.get(i));
				
				// Create an informative message and log it to the server and send it to all connected clients
				String messageToPrint = " ===== Next item for sale: " + auction.GetCurrentItem().GetName() +
				" - item starting price: " + auction.GetCurrentItem().GetStartingPrice() + " =====";
				System.out.println(messageToPrint);
				SendMessageToClients(messageToPrint);
				
				// Set the remaing bid time for an item to the default time
				auction.SetTimeRemaining(auction.deafultAuctionTime);
				
				// Keep looping until the timer hits 0
				while(auction.GetRemainingTime()!=0){
					
					// The thread will sleep every 1 second in order to ease cpu usage and also to ensure any requests can be dealt with in a timely manner
					// Remaing time will be printed to clients every 15 seconds
					if ((auction.GetRemainingTime() % auction.printTimerInterval) == 0){
						SendMessageToClients(auction.GetRemainingTime() + " seconds remaining.....");
					}
					
					try{
						Thread.sleep(1000);
					}catch(InterruptedException ie){
						ie.printStackTrace();
					}
					
					// Decrement the remaining time by 1 after the thread has slept
					auction.SetTimeRemaining(auction.GetRemainingTime() - 1);
				}
				
				// check if their have been any bids placed which are higher than the starting price
				if (auction.GetCurrentItem().GetHighestBid() > auction.GetCurrentItem().GetStartingPrice()){
					SendMessageToClients("----- " + auction.GetCurrentItem().GetName() + " was sold for " + auction.GetCurrentItem().GetHighestBid() + " -----");
				}
				else{
					SendMessageToClients("----- " + auction.GetCurrentItem().GetName() + " was not sold -----");
					itemsToReSell.add(auction.GetCurrentItem()); // Add item to re sell list if it has not been sold 
				}
			}
			
			// Clear out the current items list and repopulate it with the re sell list
			itemsToSell.clear();
			
			for (int j = 0; j < itemsToReSell.size() ; j++){
				Item it = itemsToReSell.get(j);
				itemsToSell.add(it);
				System.out.println("Item to resell " + it.GetName());
			}
			
			// Clear the re sell list for next iteration
			itemsToReSell.clear();
		}
		
		// Inform the clients the auction is over once there are no more items to sell
		SendMessageToClients("*---* THE AUCTION IS NOW OVER *---*");
		SendMessageToClients("*---* PLEASE EXIT THE AUCTION BY TYPING 'QUIT' *---*");
	}
	
	// Used to process requests from the client threads
	public void ProcessBid(String bid, ClientThread clientThread){
		
		// Try to parse an integer from the message and if it can't be done, return an error
		try{
			int numberBid = Integer.parseInt(bid);
			
			// Check if the clients bid is higher than the current bid
			if (numberBid > auction.GetCurrentItem().GetHighestBid()){
				// If it is, set it as the new highest bid
				auction.GetCurrentItem().SetHighestBid(numberBid);
				
				// Reset the auction timer back to its starting value
				auction.SetTimeRemaining(auction.deafultAuctionTime);
				
				// Inform all cleints there is now a new highest bid
				SendMessageToClients("----- NEW HIGHEST BID OF " + numberBid + " -----");
				
				// Inform the client that made the bid that they are now the highest
				clientThread.SendMessageToClient(" *** YOU ARE THE HIGHEST BIDDER ***");
				
				// Send message to all clients about the timer being reset
				SendMessageToClients(auction.GetRemainingTime() + " seconds remaining.....");
			}
			else{
				// If its not, let them know.
				clientThread.SendMessageToClient("Bid not high enough, please try again!");
			}
		}catch(NumberFormatException e){
			// Send the client a message if their bid is not formatted properly
			clientThread.SendMessageToClient("Not a valid bid");
		}
	}
	
	// Used to send the auction handler a list of connected clients from the server
	public void SetConnectedClients(ArrayList<ClientThread> connectedClients){
		this.connectedClients = connectedClients;
	}
	
	// Used to get the auction details by a client thread (for welcome message)
	public Auction GetAuctionDetails(){
		return auction;
	}
	
	// Used to send all connected clients a message
	private void SendMessageToClients(String message){
		for (int i = 0 ; i < connectedClients.size() ; i++){
			ClientThread ct = connectedClients.get(i);
			ct.SendMessageToClient(message);
		}
	}
}