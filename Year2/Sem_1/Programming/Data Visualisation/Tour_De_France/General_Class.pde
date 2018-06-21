//EntrantsGeneral Classification class which reads in info from a csv file and plots in on a bar chart when the method is called in the main class
public class General_Class
{
  //Fields
  Table General_Class_Tab; //table name 
  int SIZE = 0; //size of table
  float border = width * 0.1f; //border around edge of screen
  int Num_Per_Team; //Number of riders per team
  int Num_Teams; //Number of teams 
  ArrayList<String> teams = new ArrayList<String>(); //array list to store team names
  int Min, Max; //min and max teams
  float barWidth; //gap between bars
  
  //constructor
  General_Class()
  {
    //Create new Table for General Class
    General_Class_Tab = loadTable("General_Class.csv", "header");
    SIZE = General_Class_Tab.getRowCount();
    
    println("General Class Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : General_Class_Tab.rows()) 
    {
      int Pos = row.getInt("Position");
      String First = row.getString("First Name");
      String Last = row.getString("Last Name");
      int Num = row.getInt("Number");
      String Team = row.getString("Team Name");
      String Time = row.getString("Time");
      String Split = row.getString("Time Gap");
    }//end for each
  }//end getInfo
  
  public void drawBarGraph()
  {
    //get number of teams and Min and Max position teams
    teamDivide();
    minAndMax();
    
    //bar width and scale
    barWidth = (width - (border * 2)) / Num_Teams;
    float scale = (height - border * 2) / Max;
    
    //create new rows
    TableRow row;
    String team;
    
    //variables to get the avg pos of the team
    int pos = 0;
    int avg_pos = 0;

    //check all teams in array 
    for(int i = 0; i < teams.size(); i ++)
    {
      //check all riders in table to see if they are on the current team
      for(int j = 0 ; j < SIZE ; j ++)
      {
        row = General_Class_Tab.getRow(j);
        team = row.getString("Team Name");
        
        //check if current rider is on the team 
        if (teams.get(i).equals(team))
        {
          pos = row.getInt("Position");
          avg_pos = (pos + avg_pos);
        }//end if
      }//end inner for
      
      //draw bar chart
      float point = (i * barWidth) + border;
      float y = (avg_pos / Num_Per_Team) * scale;
      strokeWeight(2);
      fill(0, 0, 255);
      stroke(125);
      rect(point, height - border, barWidth, - y);
      
      avg_pos = 0;
    }//end for 
    
    //write the name of the graph and number of countries
    textSize(30);
    textAlign(CENTER);
    fill(0, 0, 255);
    text("Teams ranked by average position", (width / 2), height - height + border / 2); 
    textSize(15);
    text("Number of teams: " + Num_Teams, (width / 2), height - height + border / 2 + 20);
    
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
     
    //get info about teams on bar chart 
    drawInfoBox();
  }//end draw bar graph

  
  //draw and info box on screen
  public void drawInfoBox()
  {
    //check if mouse is on the graph
    if (mouseX >= border && mouseX <= width - border)
    {
      //draw position line 
      stroke(0);
      strokeWeight(2);
      line(mouseX, border , mouseX, height - border);
      int i = (int) map(mouseX, border, width - border, 0, teams.size());
      
      //stop array out of bounds error
      if (i<0)
      {
        i --;
      }
      
      if (i == teams.size())
      {
        i = teams.size() - 1;
      }//end if
      
      //get data for text box
      String team_name = teams.get(i);
      String team;
      TableRow row;
      
      //data to display
      ArrayList<String> first = new ArrayList<String>(); //first name of rider 
      ArrayList<String> last = new ArrayList<String>(); //last name of rider 
      ArrayList<Integer> pos = new ArrayList<Integer>(); //position of rider 
      ArrayList<Integer> num = new ArrayList<Integer>(); //number of rider 
      
      //check all riders in table to see if they are on the current team
      for(int j = 0 ; j < SIZE ; j ++)
      {
        row = General_Class_Tab.getRow(j);
        team = row.getString("Team Name");
        
        //check if current rider is on the team 
        if (team_name.equals(team))
        {
          //add info to array lists for team
          first.add(row.getString("First Name"));
          last.add(row.getString("Last Name"));
          pos.add(row.getInt("Position"));
          num.add(row.getInt("Number"));
        }//end if
      }//end inner for
      
      int avg_pos = 0;
      
      //for loop to get average pos of team
      for (int j = 0; j < Num_Per_Team; j ++)
      {
        avg_pos = avg_pos + pos.get(j);
      }//end for
      avg_pos = avg_pos / Num_Per_Team;
      
      //set y point for text box
      float y = border;
      
      //check to see if box goes off screen
      float check = width - border - mouseX;
      
      //check if box goes off screen
      if ( check > 450)
      {
        //draw info box
        strokeWeight(2);
        fill(255, 255, 0);
        stroke(0);
        rect(mouseX + 5, y - 40, 450, 210);
        ellipse(mouseX, y, 5, 5);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        
        text(team_name + " -- Average Pos: " + avg_pos, mouseX + 10, y - y / 5);
        for (int j = 0; j < Num_Per_Team; j ++)
        {
           text("Name: " + first.get(j) + " " + last.get(j) + " Num: " + num.get(j) + " Pos: " + pos.get(j), mouseX + 10, y + y / 5 * j );
        }//end for 
      }//end if 
      
      else
      {
        //draw info box
        strokeWeight(2);
        stroke(0);
        fill(255, 255, 0);
        rect(mouseX + 5 - 460, y - 40, 450, 210);
        ellipse(mouseX, y, 5, 5);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        text(team_name + " -- Average Pos: " + avg_pos, mouseX + 10 - 460, y - y / 5);
        for (int j = 0; j < Num_Per_Team; j ++)
        {
           text("Name: " + first.get(j) + " " + last.get(j) + " Num: " + num.get(j) + " Pos: " + pos.get(j), mouseX + 10 - 460, y + y / 5 * j );
        }//end for 
      }//end else
    }//end if
  }//end Draw Info box
  
  
  //calculates the min and max number of countries
  public void minAndMax()
  {
    //create new row
    TableRow row;
    String team;
    
    //set min and max values
    Min =  800; //random number to check if anything smaller
    Max =  0;
    
    //variables to get the avg pos of the team
    int pos = 0;
    int avg_pos = 0;

    //check all teams in array 
    for(int i = 0; i < teams.size(); i ++)
    {
      //check all riders in table to see if they are on the current team
      for(int j = 0 ; j < SIZE ; j ++)
      {
        row = General_Class_Tab.getRow(j);
        team = row.getString("Team Name");
        
        //check if current rider is on the team 
        if (teams.get(i).equals(team))
        {
          pos = row.getInt("Position");
          avg_pos = (pos + avg_pos);
        }//end if
      }//end inner for
      
      //check for min
      if (avg_pos < Min)
      {
        Min = avg_pos;
      }//end if
      
      //check for max 
      if (avg_pos > Max)
      {
        Max = avg_pos;
      }//end if
      
      avg_pos = 0;
    }//end for
    
    //get the average min and max position per team
    Max = Max / Num_Per_Team;
    Min = Min / Num_Per_Team;    
  }//end minAndMax
  
  //Method to populate array of teams from table
  public void teamDivide()
  {
    //rows for fetching data
    TableRow row;
    String team;
    
    //for loop to assign countries to an array list
    for (int i = 0; i < SIZE; i ++)
    {
      row = General_Class_Tab.getRow(i);
      team = row.getString("Team Name");
      teams.add(team);
    }
    
    //loop to check for duplicates
    for(int i = 0; i < teams.size(); i ++)
    {
        for(int j = i+1 ; j < teams.size(); j ++)
        {
            if(teams.get(i).equals(teams.get(j)))
            {
                teams.remove(j);
                j --;
            }//end if 
        }//end inner for
    }//end for
    
    //calculate the Number of teams and the number of riders per team
    Num_Teams = teams.size();
    Num_Per_Team = SIZE / Num_Teams;
  }//end team divide*/
}//end General_Class