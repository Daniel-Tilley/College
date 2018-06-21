/*
This is a progarm that takes data from the 2015 Tour De France
through files located in the data folder. The files include:

1) A general classification file
2) Average speed of the riders per stage file
3) Number of dropouts per stage file
4) Distance of each stage file
5) Type of each stage e.g hill, flat or mountain.
6) An Entrants File

The program will graph the data for the user and also calculate correlation
between things such as speed vs stage type.

The program uses a class for each csv file and also for each graph

Author: Daniel Tilley
Date: 08/11/2015
*/

//create instances of classes
Stage_Type stageType;
Distance distance;
Avg_Speed avgSpeed;
Drop_Outs dropOuts;
Entrants entrants;
General_Class generalClass;
Scatter_Graph scatterGraph;

//Size of stage tables
int SIZE = 21;

//Create image variables and calculate its size and position using border
PImage img;
float border = width * 0.1;
int bord = int(border * 25);

//menu state to choose which graph to draw
int menu_state = 0;
//choose what variables to show on the graph
int graph_to_show = 0;
//max amount of graphs to draw
int max_graphs = 0;

void setup() 
{
  //set initial frame size 
  size(1000, 600);
  
  //load up the main menu image and resacle it
  img = loadImage("Logo.png");
  img.resize(width - bord, height - bord);
  
  //Allocate memory and read in info 
  stageType  = new Stage_Type();
  stageType.getInfo();
  
  //Allocate memory and read in info
  distance = new Distance();
  distance.getInfo();
  
  //Allocate memory and read in info
  avgSpeed  = new Avg_Speed();
  avgSpeed.getInfo();
  
  //Allocate memory and read in info
  dropOuts  = new Drop_Outs();
  dropOuts.getInfo();
  
  //Allocate memory and read in info
  entrants = new Entrants();
  entrants.getInfo();
  
  //Allocate memory and read in info
  generalClass  = new General_Class();
  generalClass.getInfo();
  
  //Allocate memory to be used in Draw
  scatterGraph = new Scatter_Graph();
}//end setup

void draw()
{
  //menu for choosing graph
  switch(menu_state)
  {
    //Welcome Menu
    case 0:
    {
      background(255, 255, 0);
      image(img, (width / 2) - ((width - bord) / 2), height - height + border);
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text("--- Bienvenue a la Tour de France ---", width / 2 , height * 0.7);
      text("* Use the number keys to select what graph to choose and the mouse to selet that data to show *", width / 2 , height * 0.7 + 30);
      text("> Press 0 for the main menu <", width / 2 , height * 0.7 + 60);
      text("> Press 1 for line graphs <", width / 2 , height * 0.7 + 90);
      text("> Press 2 for bar charts <", width / 2 , height * 0.7 + 120);
      text("> Press 3 for scatter graphs <", width / 2 , height * 0.7 + 150);
      break;
    }//end case 0
    
    //Line Graph
    case 1:
    {
      //change background colour and number of graphs to be drawn
      background(255, 255, 0);
      max_graphs = 4;
      
      //choose graph to show
      switch (graph_to_show)
      {
        //distance line graph
        case 0:
        {
          distance.drawLineGraph();
          break;
        }//end case 0
        
        //avg speed line graph
        case 1:
        {
          avgSpeed.drawLineGraph();
          break;
        }//end case 1
        
        //stage type line graph
        case 2:
        {
          stageType.drawLineGraph();
          break;
        }//end case 2
        
        //drop outs line graph
        case 3:
        {
          dropOuts.drawLineGraph();
          break;
        }//end case 3
      }//end switch
      break;
    }//end case 1
    
    //Bar Chart
    case 2:
    {
      //change background colour and number of graphs to be drawn
      background(255, 255, 0);
      max_graphs = 2;
      
      //choose which graph to show
      switch (graph_to_show)
      {
        //Teams Ranks
        case 0:
        {
          generalClass.drawBarGraph();
          break;
        }//end case 0
        
        //Countries ranks
        case 1:
        {
          entrants.drawBarGraph();
          break;
        }//end case 1
      }//end switch graph to show
      break;
    }//end case 2
    
    //Scatter Graph 
    case 3:
    {
      //change background colour and number of graphs to be drawn
      background(255, 255, 0);
      max_graphs = 4;
      
      //choose which graph to show
      switch (graph_to_show)
      {
        //avg speed vs distance
        case 0:
        {
          scatterGraph.drawGraph(avgSpeed.Avg_Spd_Tab, avgSpeed.Column_Name, distance.Dist_Tab, distance.Column_Name, SIZE, "Average Speed (KM/H)", "Distance (KM)");
          break;
        }//end case 0
        
        //avg speed vs stage type
        case 1:
        {
          scatterGraph.drawGraph(avgSpeed.Avg_Spd_Tab, avgSpeed.Column_Name, stageType.Stage_Type_Tab, stageType.Column_Name, SIZE, "Average Speed (KM/H)", "Peak Size (M)");
          break;
        }//end case 1
        
        //drop outs vs stage type 
        case 2:
        {
          scatterGraph.drawGraph(dropOuts.Drop_Out_Tab, dropOuts.Column_Name, stageType.Stage_Type_Tab, stageType.Column_Name, SIZE, "Drop Outs", "Peak Size (M)");
          break;
        }//end case 2
        
        //drop outs vs distance
        case 3:
        {
          scatterGraph.drawGraph(dropOuts.Drop_Out_Tab, dropOuts.Column_Name, distance.Dist_Tab, distance.Column_Name, SIZE, "Drop Outs", "Distance (KM)");
          break;
        }//end case 3
      }//end switch graph to show
      
      break;
    }//end case 2
  }//end switch menu_state 
}//end draw

//determine what menu to show using input from keyboard
void keyPressed()
{
  if (key >= '0' && key <='3')
  {
    menu_state = key - '0';
  }//end if
}//end key pressed

void mousePressed()
{
  //check if there are more graphs to show
  if (graph_to_show < max_graphs)
  {
    graph_to_show ++;
  }//end if
  
  //if at the last grap, set graph back to first graph
  if (graph_to_show == max_graphs)
  {
    graph_to_show = 0;
  }//end if
}//end key pressed