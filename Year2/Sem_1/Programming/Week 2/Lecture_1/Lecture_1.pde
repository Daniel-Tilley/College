void setup()
{
  size(500, 500);
  stroke(255);
  fill(0);
  rad = 50;
  x = width/2;
  y = height/2;
}//end setup

float x, y, rad;
int speed = 2;
int xspeed = speed;
int yspeed = 0;
float thta = 0;
float bigrad = 200; //start at 0

void draw()
{
  background(0); 
  
  x = (width/2) + sin(thta) * bigrad;
  y = (height/2) + cos(thta) * bigrad;
  thta += 0.01f; //0.1f to change speed 
  //bigrad += 1; 
  fill(random(0,255));
  ellipse(x, y, rad, rad);
  ellipse(x-10, y-10, 5, 5);
  ellipse(x+10, y-10, 5, 5);
  ellipse(x, y, 5, 5);
  line(x-10, y+10, x+10, y+10); 
  
   /*
  x += xspeed;
  y += yspeed;
 
  if (x > width - rad/2)
  {
    xspeed = 0;
    yspeed = -speed;
    x = width - rad/2;
  }//end if 
  
  if (y < rad/2)
  {
    xspeed = -speed;
    yspeed = 0;
    y = rad/2;
  }//end if 
  
  if (x < rad/2)
  {
    xspeed = 0;
    yspeed = speed;
    x = rad/2;
  }//end if 
  
  if (y > height - rad/2)
  {
    xspeed = speed;
    yspeed = 0;
    y = height - rad/ 2;
  }//end if 
  
  */
}//end draw
