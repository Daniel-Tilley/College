//Pvectors or groups of numbers 

PVector a = new PVector();
PVector b = new PVector(10.0f, 10.0f);

a = new PVector(20, 20);
b = new PVector(-5, -7);

a.mult(2);
println(a);

a.add(b);
println(a);

b.add(a);
println(b);

a.sub(b);
println(a);

b.mult(3);
println(b);

b.sub(a);
println(b);

println(a);
println(b);

a.x = 10;
a.y = 10;
b.x = 20;
b.y = 20;

b = a;
a.x = 30;
/*
--Code Example--

//println(a);
a.x = 20;
//println(a.x);

a.add(b);
a.mult(); //multiplies vector by a scaler 
a.mag(); //returns the length of the vector as a singr figure 
a.normalize(); //calculates the length of the vector an

println(a.x);
*/
