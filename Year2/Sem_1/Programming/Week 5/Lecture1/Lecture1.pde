//Arrays.
//Arrays are always bound checked, i.e will crash if tries to read one number over the last

void setup()
{
  size(500, 500);
  background(0);
  int i;
  float t;
  int tot;
  
  t = sum (rainFall);
  tot = mini (rainFall);
  
  println (t);
  println (tot);
  
  boxSize = ((float)width / (float)rainFall.length);
}//end setup 

//float[] rainFall = new float[12]; new is like malloc in C and array set to 0s as default.
float boxSize;
float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {
 "January",
 "Februray",
 "March",
 "April",
 "May",
 "June",
 "July",
 "August",
 "September",
 "October",
 "November",
 "December" }; //end string array
 
void draw()
{
  float x = 0;
  float y = 0;
  float h = 0;
  int colour = 0;
  stroke(0);
  
  for (int i = 0 ; i < rainFall.length ; i++)
  {
    colour = (int)rainFall[i];
    fill(0, 0, colour + 150);
    h = rainFall[i];
    rect(x, y, boxSize, h);
    x +=  boxSize;
  }//end for 
}//end draw

float sum (float[] rain)
{
  float rainTotal = 0;
  
  for (int i = 0; i < rain.length ; i++)
  {
    rainTotal += rain[i];
  }//end for 
  return rainTotal;
}//end sum 

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
