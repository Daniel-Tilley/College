void setup()
{
  size(1000, 600);
  background(0);
  frameRate(2);
}//end setup 

int n; //Number of points on the star
float radius; //Radius of the circle 
float co_x, co_y; //X and Y co ordinate

void draw()
{
  stroke(random(255),random(255),random(255));
  fill(0);
  
  n = int(random(6, 10));
  radius = random (60, 100);
  co_x = random(width-width, width);
  co_y = random(height-height, height);
  
  pushMatrix();
  star(co_x, co_y, 30, radius, n); 
  popMatrix();
  
}//end draw

void star(float x, float y, float rad1, float rad2, int points)
{
  float x1; //X co-ordinate of point
  float y1; //Y co-ordinate of point 
  float angle = TWO_PI / points; //angle between lines
  float halfAngle = angle/2.0; //half angle between lines 
  
  //Start the shape drawing
  beginShape();
  
  for (float i = 0; i < TWO_PI; i += angle) 
  { 
    x1 = x + cos(i) * rad2; //X point
    y1 = y + sin(i) * rad2; //Y point 
    vertex(x1, y1); //Sets a point 
    
    x1 = x + cos(i+halfAngle) * rad1; // X point 
    y1 = y + sin(i+halfAngle) * rad1; // Y point
    vertex(x1, y1); //Sets a connecting point 
    
  }//end for
  
  //end the shape drawing
  endShape(CLOSE);
}//end star 
