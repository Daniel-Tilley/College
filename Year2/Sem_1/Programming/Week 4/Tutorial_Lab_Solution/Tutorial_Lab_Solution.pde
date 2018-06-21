boolean[] bytes = new boolean[16];
int centX, centY;
float boxWidth;

void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;  
  
  bytes[0] = true;
  bytes[2] = true;
  
  boxWidth = width / (float) bytes.length;
}


void draw()
{
  background(127);
  int bit = (bytes.length - 1);
  float red_gap = 255.0f / bytes.length;
  
  for (int i = 0 ; i < bytes.length ; i ++)
  {
    float x = i * boxWidth;
    float red = red_gap * i;
    
    if (bytes[bit])
    {
      fill(0);
    }//end if
    
    else
    {
      fill(red, 0 , 0);
    }//end else 
    
    rect(x, centY, boxWidth, boxWidth);
     -- bit;
  }//end for 
  
  int number = binaryToDecimal(bytes);
  
  // This is how you print text in Processing
  fill(255);
  text(number, centX, 100);
}

int binaryToDecimal(boolean[] bytes)
{
  int ret = 0;
  
  for (int i = 0; i < bytes.length ; i ++)
  {
    if (bytes[i])
    {
      ret += pow(2, i);
    }//end if 
  }//end for 

  return ret;
}

void mousePressed()
{
  if (mouseX > 0 && mouseX < width && mouseY > centY && mouseY < (centY + boxWidth)) 
  {
    int bit = (bytes.length -1) - ((int)(mouseX / boxWidth));
    bytes[bit] = ! bytes[bit];
  }//end if 
}
