class Ship //template for objects to create later
{
  //Fields!
  PVector pos;
  PVector forward;
  float w;
  float halfW;
  float theta;
  
  //COSNTRUCTOR
  //HAS NO RETURN TYPE 
  //HAS THE SAME NAME AS THE CLASS 
  Ship(float x, float y, float w)
  {
    pos = new PVector(x,y);
    forward = new PVector(0, -1);
    this.w = w;
    this.halfW = w * 0.5;
    theta = 0;
  }
  
  Ship()
  {
    //constructor chaining
    this(width * 0.5f, height * 0.5f, 50);
  }//end ship
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    if (keyPressed)
    {
      if (key == 'w')
      {
        pos.add(forward);
      }//end key if 
      
      if (key == 's')
      {
        pos.add(forward);
      }//end key if 
      
      if (key == 'a')
      {
        theta -= 0.1f;
      }//end key if 
      
      if (key == 'd')
      {
        theta += 0.1f;
      }//end key if 
    }//end keyPressed if 
  }//end update 
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(255);
    line(-halfW, halfW, 0, -halfW);
    line(0, - halfW, 0 + halfW, + halfW);
    line(halfW, halfW, 0, 0);
    line(- halfW, halfW, 0, 0);
    popMatrix();
  }//end render 
}
