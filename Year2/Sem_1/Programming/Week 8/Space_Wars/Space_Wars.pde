//Space wars game

void setup()
{
 size(500, 500); 
 ship = new Ship(); //allocate memory for ship
 ship1 = new Ship(100, 100, 80);
}//end setup 

//Class name should always start with upper case
Ship ship; //ship is an INSTANCE of the Ship class
Ship ship1;

void draw()
{
  background(0);
  ship.render(); //call the object 
  ship.update();
  ship1.render(); //call the object 
  ship1.update();
}//end draw 

