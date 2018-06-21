void setup()
{
  size(600, 600);
  background(0);
  cir_x = width - width + rad/2; //circle start x point
  cir_y = height/2; //circle start y point 
}//end setup 

//Colour codes
int clr1 = 84;
int clr2 = 84;
int clr3 = 84;


//circle points
int speed = 2;
int xspeed = speed;
int yspeed = speed;
int rad = 30; //circle radius 
int cir_x;
int cir_y;

void draw()
{
  //square points
  float x = width/2; //start x point square
  float y = height/2; //start y point square
  float w = height *.3; //width 
  float h = width *.3; //height
  
  fill(clr1, clr2, clr3);
  
  if(mouseX > x - (h/2)  && mouseY > y - (w/2) && mouseX < x - (h/2)+h && mouseY < y - (w/2)+w && clr1 != 255)
  {
    fill(0, 0, 255);
  }//end if 
    
  rect(x - (h/2), y - (w/2), height *.3, width *.3);
  
  fill(255);
  ellipse(cir_x, cir_y, rad, rad);
  
  
  cir_x += xspeed;
  cir_y += yspeed;
 
  if (cir_x > width - rad/2)
  {
    xspeed = 0;
    yspeed = -speed;
    cir_x = width - rad/2;
  }//end if 
  
  if (cir_y < rad/2)
  {
    xspeed = -speed;
    yspeed = -speed;
    cir_y = rad/2;
  }//end if 
  
  if (x < rad/2)
  {
    xspeed = speed;
    yspeed = speed;
    cir_x = rad/2;
  }//end if 
  
  if (y > height - rad/2)
  {
    xspeed = speed;
    yspeed = speed;
    cir_y = height - rad/ 2;
  }//end if 
  
}//end draw 

void mousePressed() 
{
  float x = width/2; //start x point square
  float y = height/2; //start y point square
  float w = height *.3; //width 
  float h = width *.3; //height
  
  if (mouseX > x - (h/2)  && mouseY > y - (w/2) && mouseX < x - (h/2)+h && mouseY < y - (w/2)+w && clr1 == 84) 
  {
    clr1 = 255;
    clr2 = 0;
    clr3 = 0;
  }//end if 
  
  else if (mouseX > x - (h/2)  && mouseY > y - (w/2) && mouseX < x - (h/2)+h && mouseY < y - (w/2)+w) 
  {
    clr1 = 84;
    clr2 = 84;
    clr3 = 84;
  }//end else
}//end mousePressed
