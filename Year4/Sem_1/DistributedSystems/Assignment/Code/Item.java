// This class is a model class used to represent a single item for sale in an auction
public class Item{
	
	private String name;
	private int startingPrice;
	private int highestBid;
	
	public Item(String name, int startingPrice){
		this.name = name;
		this.startingPrice = startingPrice;
		highestBid = startingPrice;
	}
	
	public String GetName(){
		return name;
	}
	
	public int GetHighestBid(){
		return highestBid;
	}
	
	public int GetStartingPrice(){
		return startingPrice;
	}
	
	public void SetHighestBid(int bid){
		highestBid = bid;
	}
}