public class Book
{
	private int numCopies; //number of copies in library
	private int onShelf; //number of copies on shelf
	private String title; //name of book
	
	void public Book(int num, int book, String name)
	{
		numCopies = num;
		onShelf = book;
		title = name;
	}//end Library 
	
	public Borrowed()
	{
		return title;
	}//end borrowed
	
	public Returned()
	{
		return title;
	}//end title 
}//end book

public class Copy
{
	private String member;
	
	public void Copy()
	{
	}//end 
	
	public BorrowedBy(String mem)
	{
		member = mem;
	}//end Borrowed by 
	
	public Returned()
	{
		return member;
	}//end returned
}//end class Copy

public class Member
{
	private String name; //name of user 
	private String validate = "Yes"; //validation to see if they can borrow
	private book; //book name
	
	public void Member(String var)
	{
		name = var;
	}//end Member
	
	public Borrow(String var1)
	{
		book = var1;
	}//end borrow 
	
	public Return(String var1)
	{
		book = var1;
	}//end borrow 
	
	public okToBorrow()
	{
		return validate;
	}//end ok to borrow
}//class member

public class StaffMember
{
	public void StaffMember()
	{
	}//end StaffMemeber
}//end class staff member 

public class BorrowControl
{
	private int member_id; //member id 
	private int copy_id; //copy id 
	
	public void BorrowControl(id1, id2)
	{
		member_id = id1;
		copy_id = id2;
	}//end borrow control
}//end class BorrowControl

public class LibraryExample 
{
    public static void main(String[] arg)
	{
        System.out.println("Library Program to test Library classes");
        
        Book book1 = new Book(10, 5, "My Book");
        Member member1 = new Member("John Smith");
    }//end main
}//end Library Class