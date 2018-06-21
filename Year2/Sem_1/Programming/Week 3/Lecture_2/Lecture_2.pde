// Sin(0) = O/H
// Cos(0) = A/H
// Sin(0)R = X
// -Cos(0)R = Y

void setup()
{
  size(500, 500); 
  cx = width / 2.0f;
  cy = height / 2.0;
  r = 100;
  theta = 0.0f;
}

float cx, cy;
float r;
float theta;
float arms;

void draw()
{
  background(0);
  float g = random (0, 255);
  float b = random (0, 255);
  stroke(0, g, b);
  fill(0 , g, b);
  float ThethaInc = TWO_PI / arms;
  r = 10; 
  float offset = 0.1f;
  
  for(int Ccount = 0; Ccount < 10; Ccount ++)
  {
    for(float theta = 0; theta < TWO_PI; theta += ThethaInc)
    {
      float x, y;
      x = cx + sin(theta) * r;
      y = cy - cos(theta) * r;
      ellipse(x, y, 30, 30);
    }
   r += 10f; 
   offset += 0.1f;
  }
}
