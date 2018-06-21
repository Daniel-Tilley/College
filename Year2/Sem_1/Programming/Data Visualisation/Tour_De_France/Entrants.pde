//Entrants class which reads in info from a csv file and plots in on a bar chart when the method is called in the main class
public class Entrants
{
  //Fields
  Table Entrants_Tab; //table name 
  int SIZE = 0; //size of table
  float border = width * 0.1f; //border around edge of screen
  int num_countries; //number of countries in tour
  ArrayList<String> countries = new ArrayList<String>(); //array list to store country names
  ArrayList<Integer> num_per_country = new ArrayList<Integer>(); //array list to store number of people per country
  int Min, Max; //min and max countries 
  float barWidth; //width between bars
  
  //constructor
  Entrants()
  {
    //Create new Table for Entrants
    Entrants_Tab = loadTable("Entrants.csv", "header");
    SIZE = Entrants_Tab.getRowCount();
    
    println("Entrants Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : Entrants_Tab.rows()) 
    {
      String First = row.getString("First Name");
      String Last = row.getString("Last Name");
      String Country = row.getString("Country");
      int Num = row.getInt("Number");
      String Team = row.getString("Team Name");
    }//end for each
  }//end getInfo
  
  //draw BarChart Method
  public void drawBarGraph()
  {
    //calculate the number of countries and the Min and Max number of people per country
    calcCountries();
    minAndMax();
    
    //bar width and instances of countries
    barWidth = (width - (border * 2)) / num_countries;
    int count = 0;
    String country;
    TableRow row;
    float scale = (height - border * 2) / Max;
    
    //check all countries in array 
    for(int i = 0; i < countries.size(); i ++)
    {
      //set count back to 0
      count = 0;
      
      //check all countries in table
      for(int j = 0 ; j < SIZE ; j ++)
      {
        row = Entrants_Tab.getRow(j);
        country = row.getString("Country");
        
        //check how many riders there are per country
        if(countries.get(i).equals(country))
        {
          //increment count if an instance is found
          count ++;
        }//end if 
      }//end inner for
      
      //add number of riders per county to array
      num_per_country.add(count);
      
      //draw bar chart //<>//
      float point = (i * barWidth) + border;
      float y = count * scale;
      strokeWeight(2);
      fill(0, 0, 255);
      stroke(125);
      rect(point, height - border, barWidth, - y);
    }//end for 
    
    //write the name of the graph and number of countries
    textSize(30);
    textAlign(CENTER);
    fill(0, 0, 255);
    text("Number of Riders per Country", (width / 2), height - height + border / 2); 
    textSize(15);
    text("Number of countries: " + num_countries, (width / 2), height - height + border / 2 + 20);
    
    //draw the border
    stroke(0);
    strokeWeight(4);
    line(border - 5, height - border, width - border, height - border);
    line(border, border, border, height - border + 5);
    
    //draw notches
    line(width - border, height - border - 5, width - border, height - border + 5);
    line(border - 5, border, border + 5, border);
    
    //mark max and min points
    textSize(15);
    textAlign(LEFT);
    text("0", border - 85 , height - border + 5);
    text(Max, border - 85 , border + 5);
    
    //get info per country
    drawInfoBox();
  }//end draw bar graph
  
  
  //draw info box
  public void drawInfoBox()
  {
    //check if mouse is on the graph
    if (mouseX >= border && mouseX <= width - border)
    {
      //draw position line 
      stroke(0);
      strokeWeight(2);
      line(mouseX, height - border , mouseX, height - border/2);
      int i = (int) map(mouseX, border, width - border, 0, countries.size());
      
      //stop array out of bounds error
      if (i<0)
      {
        i --;
      }
      
      if (i == countries.size())
      {
        i = countries.size() - 1;
      }//end if
      
      //variables to show
      String country = countries.get(i); // name of countries
      int num = num_per_country.get(i); //number of people per country
      
      //set y point for text box
      float y = height - border/2;
      
      //check to see if box goes off screen
      float check = width - border - mouseX;
      
      //check if box goes off screen
      if ( check > 50)
      {
        //draw info box
        strokeWeight(2);
        fill(255, 255, 0);
        stroke(0);
        rect(mouseX + 5, y - 20, 70, 30);
        ellipse(mouseX, y, 5, 5);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        text(country + ": " + num, mouseX + 10, y);
      }//end if 
      
      else
      {
        //draw info box
        strokeWeight(2);
        fill(255, 255, 0);
        stroke(0);
        rect(mouseX + 5 - 80, y - 20, 70, 30);
        ellipse(mouseX, y, 5, 5);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        text(country + ": " + num, mouseX + 10 - 80, y);
      }//end else
    }//end if 
  }//end Draw Info box
  
  
  //calculates the min and max number of countries
  public void minAndMax()
  {
    //create new row
    TableRow row;
    String country;
    
    //set min and max values
    Min =  10; //random number to check if anything smaller
    Max =  0;
    
    //counter to check countries
    int count = 0;
    
    //check all countries in array 
    for(int i = 0; i < countries.size(); i ++)
    {
      //check all countries in table
      for(int j = i + 1 ; j < SIZE ; j ++)
      {
        row = Entrants_Tab.getRow(j);
        country = row.getString("Country");
        
        if(countries.get(i).equals(country))
        {
          //increment count if an instance is found
          count ++;
          
          //check for min
          if (count < Min)
          {
            Min = count;
          }//end if
        }//end if 
      }//end inner for
        
      //check for max 
      if (count > Max)
      {
        Max = count;
      }//end if
      
      count = 0;
    }//end for
  }//end minAndMax
  
  
  //calculate number of countries in tour
  public void calcCountries()
  {
    //rows for fetching data
    TableRow row;
    String country;
    
    //for loop to assign countries to an array list
    for (int i = 0; i < SIZE; i ++)
    {
      row = Entrants_Tab.getRow(i);
      country = row.getString("Country");
      countries.add(country);
    }
    
    //loop to check for duplicates
    for(int i = 0; i < countries.size(); i ++)
    {
        for(int j = i+1 ; j < countries.size(); j ++)
        {
            if(countries.get(i).equals(countries.get(j)))
            {
                countries.remove(j);
                j --;
            }//end if 
        }//end inner for
    }//end for
    
    //get total number of countries
    num_countries = countries.size();
  }//end calc Countries
}//end General_Class