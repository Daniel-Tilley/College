//Lab Solution 

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  fill(0);
}//end setup

void draw()
{
  boolean happy = true;
  for(int y = 0; y < height; y+=50)
  {
    for(int x = 0; x < width; x+=50)
    { 
      ellipse(x+25, y+25, 50 , 50); //face 
      ellipse(x+25, y+25, 5, 5); //nose 
      ellipse(x+15, y+15, 5, 5); //left eye
      ellipse(x+35, y+15, 5, 5); //right eye
      line(x+15, y+35, x+35, y+35); //bottom mouth line
      if (happy)
      {
        line(x+15, y+35, x+10, y+30); //left mouth line 
        line(x+35, y+35, x+40, y+30); //right mouth line
      }//end if
      else
      {
        line(x+15, y+35, x+10, y+40); //left mouth line 
        line(x+35, y+35, x+40, y+40); //right mouth line
      }//end else
      
      happy= !happy; //flips the value of happy using a bang (!)
    }//end inner for 
    
    happy= !happy;
  }//end for
}//end draw 
