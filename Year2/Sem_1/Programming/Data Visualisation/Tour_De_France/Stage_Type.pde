//Stage tyoe class which reads in data from csv and calls a The line Graph class
public class Stage_Type
{
   //Fields
  Table Stage_Type_Tab; //table name 
  int SIZE = 0; //size of table
  String Column_Name = "Highest Peak in M"; //name of column 
  Line_Graph lineGraph; //create instance of line graph
  
  //constructor
  Stage_Type()
  {
    //Create new Table for Stage Type
    Stage_Type_Tab = loadTable("Stage_Type.csv", "header");
    SIZE = Stage_Type_Tab.getRowCount();
    
    println("Stage Type Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : Stage_Type_Tab.rows()) 
    {
      String Stage_Num = row.getString("Stage Num");
      String Type = row.getString("Stage Type");
      float Peak = row.getFloat("Highest Peak in M");
    }//end for each
  }//end getInfo
  
  //draw line graph method wihich calls the line graph class and passes it data
  public void drawLineGraph()
  {
    lineGraph = new Line_Graph(Stage_Type_Tab, Column_Name, SIZE, "Stage Type (Max Peak)", "M");
    lineGraph.drawGraph();
  }//end drawLineGraph
}//end Stage_Type