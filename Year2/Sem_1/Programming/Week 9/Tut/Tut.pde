void setup()
{
  String s = "I wandered lonely as a cloud";
  s += "That floats on high or vales and hills";
  
  println(s);
  
  for (int i = s.length() - 1; i >= 0 ; i --)
  {
    println(s.charAt(i));
  }//end for 
  
  //These return a new string, 2 is start point and 10 is end point
  String ss = s.substring(2, 10);
  println(ss);
  
  //finding strings 
  int i = s.indexOf("lonely");
  
  if (i != -1)
  {
    ss = s.substring(i, i + 6);
    println(ss);
  }//end if
  
  String test = "Username: skooter500";
  String name = test.substring(test.indexOf(":") + 2);  
  println(name);
  
  String test1 = "Username: Bryan, password: PPP";
  String name1 = test1.substring(test1.indexOf(":") + 2 , test1.indexOf(","));
  println(name1);
  
  String test2 = "<title>Tunepal.org</title>";
  String name2 = test2.substring(test2.indexOf(">") + 1, test2.indexOf("</"));
  println(name2);
}

void draw()
{
  
}