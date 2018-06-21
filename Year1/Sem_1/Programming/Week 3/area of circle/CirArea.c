/* This is a program that will calculate and display the area of a circle 
Author: Daniel Tilley
Date: 30/09/2014
*/

#include <stdio.h>
main()
{
    float r,pi,ans;
    
    r=4.8;
    pi=3.14;
    ans=0;
    
    ans = (pi*(r*r));
    
    printf("The area of the circle is %f",ans);
    
    getchar();
    
}//endmain