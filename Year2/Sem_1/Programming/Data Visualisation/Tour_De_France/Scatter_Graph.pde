//Scatter graph class takes data from two classes in main and plots them against each other to calcuate the corelation
public class Scatter_Graph
{
  //fields
  Table Tab_x; //table for x points
  Table Tab_y; //table for y points
  float border = width * 0.1f; //border around edge of screen
  String t1, t2; //table names
  String c1, c2; //column names in tables
  
  //min and max values to be used in scatter graph
  float min_x;
  float min_y;
  float max_x;
  float max_y;
  
  int SIZE; //size of table
   
  //constuctor
  Scatter_Graph()
  {
  }//end Scatter Graph
  
  //max and min method for x axis
  public void minAndMax_X()
  {
    //create new rows
    TableRow row, row1;
    
    //set row = to the first element in the table
    row = Tab_x.getRow(0);
    min_x = row.getFloat(c1);
    max_x = row.getFloat(c1);
    
    //for loop to check min and max
    for (int i = 0; i < SIZE; i++)
    {
      //assign next row data to row1
      row1 = Tab_x.getRow(i);
      
      //check for max 
      if (row1.getFloat(c1) > max_x)
      {
        max_x = row1.getFloat(c1);
      }//end if 
      
      //check for min
      if (row1.getFloat(c1) < min_x)
      {
        min_x = row1.getFloat(c1);
      }//end if 
    }//end for
  }//end minAndMax_X
  
  //max and min method for axis
  public void minAndMax_Y()
  {
    //create new rows
    TableRow row, row1;
    
    //set row = to the first element in the table
    row = Tab_y.getRow(0);
    min_y = row.getFloat(c2);
    max_y = row.getFloat(c2);
    
    //for loop to check min and max
    for (int i = 0; i < SIZE; i++)
    {
      //assign next row data to row1
      row1 = Tab_y.getRow(i);
      
      //check for max 
      if (row1.getFloat(c2) > max_y)
      {
        max_y = row1.getFloat(c2);
      }//end if 
      
      //check for min
      if (row1.getFloat(c2) < min_y)
      {
        min_y = row1.getFloat(c2);
      }//end if 
    }//end for
  }//end minAndMax_Y
  
  //draw the scatter graph
  public void drawGraph(Table Tab1, String col1, Table Tab2, String col2, int size, String tab1, String tab2)
  {
    //assign variables from main
    Tab_x = Tab1;
    Tab_y = Tab2;
    t1 = tab1;
    t2 = tab2;
    c1 = col1;
    c2 = col2;
    SIZE = size;
    
    //calculate correlation
    correlationCalc();
    
    //create new table rows to get info
    TableRow row_x, row_y;
    float x_point, y_point;
    
    //call the minAndMax number
    minAndMax_X();
    minAndMax_Y();
    
    //write the name of the graph
    textSize(30);
    textAlign(CENTER);
    fill(0, 0, 255);
    text(t1 + " vs " + t2, (width / 2), height - height + border / 4); 
    
    //draw the border
    stroke(0);
    strokeWeight(4);
    line(border - 5, height - border, width - border, height - border);
    line(border, border, border, height - border + 5);
    
    //draw notches and mark max points
    line(width - border, height - border - 5, width - border, height - border + 5);
    line(border - 5, border, border + 5, border);
    
    textSize(15);
    textAlign(CENTER);
    text(min_x, border, height - border + 25);
    text(max_x, width - border, height - border + 25);
    textAlign(LEFT);
    text(min_y, border - 85 , height - border + 5);
    text(max_y, border - 85 , border + 5);
    
    //name vertices
    textAlign(CENTER);
    text(t1, width/2, height - border + 25);
    textAlign(LEFT);
    text(t2, border - 100 , height/2);
    
    //loop to draw the line graph
    for (int i = 0 ; i < SIZE ; i ++)
    {
      //get the info for the current and previous row
      row_x = Tab_x.getRow(i);
      row_y = Tab_y.getRow(i);
      
      //get variables from rows
      x_point = row_x.getFloat(c1);
      y_point = row_y.getFloat(c2);
      
      //draw the graph by mapping points to graph range
      stroke(0, 0, 255);
      strokeWeight(8);
      float x = map(x_point, min_x, max_x, border, width - border);
      float y = map(y_point, min_y, max_y, height - border, border);
      point(x, y);
    }//end for
  }//end draw Graph
  
  //calculate the correlation coeficiant
  void correlationCalc()
  {
    //array list to store X and y points
    ArrayList<Float> X_cor = new ArrayList<Float>(); 
    ArrayList<Float> Y_cor = new ArrayList<Float>(); 
    //rows for fetching data
    TableRow rowx, rowy;
    float x_row, y_row;
    
    //assign table rows into array lists
    for (int i = 0; i < SIZE; i ++)
    {
      //fetch rows
      rowx = Tab_x.getRow(i);
      rowy = Tab_y.getRow(i);
      
      //get variables
      x_row = rowx.getFloat(c1);
      y_row = rowy.getFloat(c2);
      
      //add variables to array list 
      X_cor.add(x_row);
      Y_cor.add(y_row);
    }//end for
    
    //variables for calculation 
    double sx = 0.0; //sum x
    double sy = 0.0; //sum y
    double sxx = 0.0; //sum x * x
    double syy = 0.0; //sum y * y
    double sxy = 0.0; //sum x * y
    double cov = 0.0;
    double sigmax = 0.0;
    double sigmay = 0.0;
    double corelation = 0.0; //corelation coefficiant variable to be displayed 
    
    //calculate sums
    for(int i = 0; i < SIZE; ++i) 
    {
      double x = (double)X_cor.get(i);
      double y = (double)Y_cor.get(i);

      sx += x;
      sy += y;
      sxx += x * x;
      syy += y * y;
      sxy += x * y;
    }//end for
    
    // covariation
    cov = sxy / SIZE - sx * sy / SIZE / SIZE;
    // standard error of x
    sigmax = Math.sqrt(sxx / SIZE -  sx * sx / SIZE / SIZE);
    // standard error of y
    sigmay = Math.sqrt(syy / SIZE -  sy * sy / SIZE / SIZE);
    
    //get correlation and round to 3 decimal places
    corelation = cov / sigmax / sigmay;
    corelation = Math.round(corelation*1000)/1000.0d;
    
   //println(corelation);
    //create a string to print result
    String result = Double.toString(corelation);
    
    //decide what message to display depending on cor coefficient
    if (corelation < 1 && corelation >= 0.5)
    {
      textSize(15);
      textAlign(CENTER);
      text("Good positive Correlation with coefficient: " + result, width / 2, height - border + 50); 
    }//end if
    
    if (corelation < 0.5 && corelation >= 0)
    {
      textSize(15);
      textAlign(CENTER);
      text("Poor positive Correlation with coefficient: " + result, width / 2, height - border + 50); 
    }//end if 
    
    if (corelation > -1 && corelation <= -0.5)
    {
      textSize(15);
      textAlign(CENTER);
      text("Good negative Correlation with coefficient: " + result, width / 2, height - border + 50); 
    }//end if 
    
    if (corelation > -0.5 && corelation <= 0)
    {
      textSize(15);
      textAlign(CENTER);
      text("Poor negative Correlation with coefficient: " + result, width / 2, height - border + 50); 
    }//end if
  }//end correlationCalc
}//end class Scatter Graph