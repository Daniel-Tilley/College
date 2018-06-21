//Avg Speed class which reads in data from csv and calls a The line Graph class
public class Avg_Speed
{
  //Fields
  Table Avg_Spd_Tab; //table name 
  int SIZE = 0; //size of table
  String Column_Name = "Speed in KM"; //name of column 
  Line_Graph lineGraph; //create instance of line graph
  
  //constructor
  Avg_Speed()
  {
    //Create new Table for AVG speed
    Avg_Spd_Tab = loadTable("Average_Speed.csv", "header");
    SIZE = Avg_Spd_Tab.getRowCount();
    
    println("Avg Speed Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : Avg_Spd_Tab.rows()) 
    {
      String Stage_Num = row.getString("Stage Num");
      float Speed = row.getFloat("Speed in KM");
    }//end for each
  }//end getInfo
  
  //draw line graph method wihich calls the line graph class and passes it data
  public void drawLineGraph()
  {
    lineGraph = new Line_Graph(Avg_Spd_Tab, Column_Name, SIZE, "Average Speed", "KM/H");
    lineGraph.drawGraph();
  }//end drawLineGraph
}//end Avg_Speed