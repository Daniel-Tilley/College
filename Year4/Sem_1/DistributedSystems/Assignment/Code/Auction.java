import java.util.*;

// This class is a model class used to represent a single auction
public class Auction{
	private ArrayList<Item> itemsToSell;
	private Item currentItem;
	private int timeRemaining;
	public final int deafultAuctionTime = 60; // Default amout of time given to place bids, should be changed here
	public final int printTimerInterval = 15; // Interval used to determine how often to print timer to clients


	public Auction(){
		itemsToSell = new ArrayList<Item>();

		// Create now items to sell
		itemsToSell.add(new Item("BMW", 5000));
		itemsToSell.add(new Item("House", 250000));
		itemsToSell.add(new Item("Book", 20));
		itemsToSell.add(new Item("Movie", 10));
		itemsToSell.add(new Item("Bike", 300));

		// Set the current item so that it can be accessed
		SetCurrentItem(itemsToSell.get(0));
	}

	public ArrayList<Item> GetItemsToSell(){
		return itemsToSell;
	}

	public Item GetCurrentItem(){
		return currentItem;
	}

	public int GetRemainingTime(){
		return timeRemaining;
	}

	public void SetCurrentItem(Item item){
		currentItem = item;
	}

	public void SetTimeRemaining(int time){
		timeRemaining = time;
	}

	// Welcome message printed to the client upon connection to the server
	public String GetWelcomeMessage(){
		String message = "Welcome to the auction - ";
		message += "The current item for sale is: " + GetCurrentItem().GetName() + " - ";
		message += "The current highest bid for the item is: " + GetCurrentItem().GetHighestBid() + " - ";
		message += "Please place a bid higher than the current highest bid or wait for the next item";

		return message;
	}
}
