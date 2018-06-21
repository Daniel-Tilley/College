void setup()
{
  size(1200, 200);
  background(0);
}//end setup

int body = 100;
int nose = 100;
int eye1 = 50;
int eye2 = 150;
int mouth1a = 50;
int mouth1b = 150;
int mouth2a = 50;
int mouth2b = 40;
int mouth3a = 150;
int mouth3b = 160;

void draw()
{
  stroke(255,255,0);
  fill(0,0,0);
  ellipse(body, 100, 200, 200);//body 
  ellipse(nose, 100, 10, 10);// nose
  ellipse(eye1, 50, 10, 10);//eye 1
  ellipse(eye2, 50, 10, 10);//eye 2
  line(mouth1a, 140, mouth1b, 140);//mouth middle
  line(mouth2a, 140, mouth2b, 130);//mouth left
  line(mouth3a, 140, mouth3b, 130);//mouth right
  for(int i=0; i<3; i++)
  {
    ellipse(body+=200, 100, 200, 200);
    ellipse(nose+=200, 100, 10, 10);
    ellipse(eye1+=200, 50, 10, 10);
    ellipse(eye2+=200, 50, 10, 10);
    line(mouth1a+=200, 140, mouth1b+=200, 140);//mouth middle
    line(mouth2a+=200, 140, mouth2b+=200, 130);//mouth left
    line(mouth3a+=200, 140, mouth3b+=200, 130);//mouth right
  }//end for
}//end draw 
