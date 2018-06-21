//Drop Outs class which reads in data from csv and calls a The line Graph class
public class Drop_Outs
{
  //Fields
  Table Drop_Out_Tab; //table name 
  int SIZE = 0; //size of table
  String Column_Name = "Drop Outs"; //name of column 
  Line_Graph lineGraph; //create instance of line graph
  
  //constructor
  Drop_Outs()
  {
    //Create new Table for Drop Outs 
    Drop_Out_Tab = loadTable("Drop_Outs.csv", "header");
    SIZE = Drop_Out_Tab.getRowCount();
    
    println("Drop Outs Table Loaded");
  }//end Avg Speed contructor
  
  //Get info method to retrieve info from the csv file
  public void getInfo()
  {
    for (TableRow row : Drop_Out_Tab.rows()) 
    {
      String Stage_Num = row.getString("Stage Num");
      int Drops = row.getInt("Drop Outs");
    }//end for each
  }//end getInfo
  
  //draw line graph method wihich calls the line graph class and passes it data
  public void drawLineGraph()
  {
    lineGraph = new Line_Graph(Drop_Out_Tab, Column_Name, SIZE, "Drop Outs", "");
    lineGraph.drawGraph();
  }//end drawLineGraph
}//end General_Class