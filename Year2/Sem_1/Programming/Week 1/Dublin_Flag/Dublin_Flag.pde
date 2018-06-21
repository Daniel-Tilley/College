//Dublin Flag

void setup()
{
  size(500, 500);
  background(0);
}//end setup

void draw()
{
  boolean dark = true;
  for(int y = 0; y < height; y+=50)
  {
    for(int x = 0; x < width; x+=50)
    { 
      if (dark)
      {
        stroke(13, 26, 129);
        fill(13, 26, 129);
      }//end if
      else
      {
        stroke(63, 79, 232);
        fill(63, 79, 232);
      }//end else
      
      rect(x, y, 50, 50);
      dark = !dark;
    }//end inner for 
    
    dark = !dark;
  }//end for
}//end draw 
