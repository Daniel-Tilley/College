
class Customer 
{
    private String name;
	
    public Customer(String n) 
	{
        name = n;
    }
    
    public BankAccount openNewAccount( String accType)
	{
        BankAccount acc;
        if (accType == "cur")
		{
            acc = new CurrentAccount(this);
		}
        else 
		{
            acc = new SavingsAccount(this);
		}
        
        return acc;
    }
	
    public void depositMoney(int x, BankAccount acc) throws Exception 
	{
        acc.mkDeposit(x);
    }
	
	public void withdrawMoney(int x, BankAccount acc) throws Exception 
	{
        acc.mkWithdrawel(x);
    }
	
    public String getName()
	{
        return name;
    }
}

abstract class BankAccount 
{
    private String accNo;
    private int balance;
    private Customer customer;
    
    private static int nextAccNo = 0;
    
    public BankAccount( Customer c) 
	{
        accNo = Integer.toString(++nextAccNo);
        customer = c;
        balance = 0;
    }
    
    public void mkDeposit(int x) throws Exception 
	{
        if (x <= 0) throw new Exception("Amount <= 0\n");
        
        balance = balance + x;
    }
	
	public void mkWithdrawel(int x) throws Exception 
	{
        if (x <= 0) throw new Exception("Amount <= 0\n");
        
		balance = balance - x;
    }
    
    public String toString()
	{
        String result = "\nHolder of account number " + accNo + " is " + customer.getName() 
          +  ", balance = " + Integer.toString(balance);
        return result;
    } 
}

class CurrentAccount extends BankAccount 
{
    public CurrentAccount(Customer c)  
	{
        super(c);
    }  
}

class SavingsAccount extends BankAccount
{
    private float rate;
    
    public SavingsAccount(Customer c) 
	{
        super(c);
    }
}

class BankExample 
{
    public static void main(String[] arg) throws Exception 
	{
        System.out.println("Bank Program to test class model");
        
        Customer john = new Customer("John Smith");
        BankAccount b = new SavingsAccount(john);
        System.out.println(b);
        
        john.depositMoney(150, b);
		System.out.println("\nAfter deposit:"); 
        System.out.println(b);  

		john.withdrawMoney(10, b);
		System.out.println("\nAfter withdrawal:"); 
		System.out.println(b); 
    }
}