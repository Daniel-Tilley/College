//Distance class which reads in data from csv and calls a The line Graph class
public class Distance
{
  //Fields
  Table Dist_Tab; //table name 
  int SIZE = 0; //size of table
  String Column_Name = "Distance in KM"; //name of column 
  Line_Graph lineGraph; //create instance of line graph
  
  //constructor
  Distance()
  {
    //Create new Table for Distance
    Dist_Tab = loadTable("Distance.csv", "header");
    SIZE = Dist_Tab.getRowCount();
    
    println("Distance Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : Dist_Tab.rows()) 
    {
      String Stage_Num = row.getString("Stage Num");
      float Distance = row.getFloat("Distance in KM");
    }//end for each
  }//end getInfo
  
  //draw line graph method wihich calls the line graph class and passes it data
  public void drawLineGraph()
  {
    lineGraph = new Line_Graph(Dist_Tab, Column_Name, SIZE, "Distance", "KM");
    lineGraph.drawGraph();
  }//end drawLineGraph
}//end General_Class