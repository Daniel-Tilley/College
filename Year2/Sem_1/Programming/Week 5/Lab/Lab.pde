void setup()
{
  size(1000, 1000);
  background(0);
  
}//end Setup 

float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }; 

void draw()
{
}//end Draw

int mini (float[] rain)
{
  float min = rain[0];
  int index = 0;
  
  for (int i = 0; i < rain.length ; i++)
  {
    if (rain[i] < min)
    {
      min = rain[i];
      index  = i;
    }//end if 
  }//end for 
  
  return index;
}//end min 

void drawAxis(float[] data, String[] labels, int intervals, float border)
{
}//end Draw Axis 
