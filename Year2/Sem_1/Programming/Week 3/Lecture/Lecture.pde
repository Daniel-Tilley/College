void setup()
{
  size(500, 500);
}

float px = 100, py = 400;
float h = 176 , o, a;
float theta = 27;

void draw()
{
  background(0);
  stroke(255);
  fill(255);
  
  h = height - mouseY;
  o = sin(radians(theta)) * h; //must be in rads
  a = cos(radians(theta)) * h;
  
  line(px, py, px + a, py - o);
  line(px + a, py - o, px + a, py);
  line(px , py, px + a, py);
  
  text("Kite extents: " + h, 10, 20);
  text("Kite height: " + 0, 10, 40);
  text("Kite horizontal distance: " + a, 10, 60); 
}



