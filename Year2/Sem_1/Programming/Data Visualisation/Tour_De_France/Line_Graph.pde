//Line graph class which takes data from other classes and plots them on a line graph
public class Line_Graph
{
  //Fields
  Table table; //table to print table from 
  String Column_Name; //name of column to take data from 
  Float Min; //minimum on graph
  Float Max; //maximum on graph
  int SIZE; //size of the table
  float border = width * 0.1f; //border around edge of screen
  String graph_name; //Name of graph to be displayed on screen
  String unit; //unit of measurment for graph
  
  //constructor
  Line_Graph(Table tab, String col, int size, String name, String var)
  {
    table = tab;
    Column_Name = col;
    SIZE = size;
    graph_name = name;
    unit = var;
  }//end line Graph
  
  //calculate the min and max values for the graph
  public void minAndMax()
  {
    //create new rows
    TableRow row, row1;
    
    //set row = to the first element in the table
    row = table.getRow(0);
    Min = row.getFloat(Column_Name);
    Max = row.getFloat(Column_Name);
    
    //for loop to check min and max
    for (int i = 0; i < SIZE; i++)
    {
      //assign next row data to row1
      row1 = table.getRow(i);
      
      //check for max 
      if (row1.getFloat(Column_Name) > Max)
      {
        Max = row1.getFloat(Column_Name);
      }//end if 
      
      //check for min
      if (row1.getFloat(Column_Name) < Min)
      {
        Min = row1.getFloat(Column_Name);
      }//end if 
    }//end for
  }//end minAndMax
  
  //draw the line graph
  public void drawGraph()
  {
    //create new table rows and variables to get info
    TableRow row, row1;
    float prev;
    float current;
    
    //call the minAndMax number
    minAndMax();
    
    //write the name of the graph
    textSize(30);
    textAlign(CENTER);
    fill(0, 0, 255);
    text(graph_name, (width / 2), height - height + border / 2); 
    
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
    text(Min, border - 85 , height - border + 5);
    text(Max, border - 85 , border + 5);
    
    //loop to draw the line graph
    for (int i = 1 ; i < SIZE ; i ++)
    {
      //get the info for the current and previous row
      row = table.getRow(i);
      row1 = table.getRow(i - 1);
      
      //get variables from rows
      current = row.getFloat(Column_Name);
      prev = row1.getFloat(Column_Name);
      
      //draw the graph by mapping points to graph range
      stroke(0, 0, 255);
      float x1 = map(i - 1, 0, SIZE - 1, border, width - border);
      float y1 = map(prev, Min, Max, height - border, border);
      float x2 = map(i, 0, SIZE - 1, border, width - border);
      float y2 = map(current, Min, Max, height - border, border);
      line(x1, y1, x2, y2);
      
      //points on graph
      ellipse(x1, y1, 5, 5);
      ellipse(x2, y2, 5, 5);
    }//end for
    
    //get info about certain point
    drawInfoBox();
  }//end drawLineGraph
  
  //draw the info box
  void drawInfoBox()
  {
    //check if mouse is on the graph
    if (mouseX >= border && mouseX <= width - border)
    {
      //draw position line 
      stroke(0);
      strokeWeight(2);
      line(mouseX, border, mouseX, height - border);
      int i = (int) map(mouseX, border, width - border, 0, SIZE - 1);
      
      //get row
      TableRow row = table.getRow(i);
      
      //get data
      float num = row.getFloat(Column_Name);
      
      //map points for ellipse
      float y = map(num, Min, Max, height - border, border);
      strokeWeight(4);
      stroke(0);
      ellipse(mouseX, y, 5, 5);
      
      //check to see if box goes off screen
      float check = width - border - mouseX;
      
      //check if box goes off screen
      if ( check > 250)
      {
        //draw info box
        strokeWeight(2);
        stroke(0);
        fill(255, 255, 0);
        rect(mouseX + 5, y - 20, 250, 40);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        text("Stage: " + (i+1), mouseX + 10, y);
        text(graph_name + ": " + num + " " + unit, mouseX + 10, y + 15);
      }//end if 
      
      else
      {
        //draw info box
        strokeWeight(2);
        stroke(0);
        fill(255, 255, 0);
        rect(mouseX + 5 - 260, y - 20, 250, 40);
        
        //write text 
        textSize(15);
        textAlign(LEFT);
        fill(0);
        text("Stage: " + (i+1), mouseX + 10 - 260, y);
        text(graph_name + ": " + num + " " + unit, mouseX + 10 - 260, y + 15);
      }//end else
    }//end if 
  }//end Draw Info box
}//end line graph class