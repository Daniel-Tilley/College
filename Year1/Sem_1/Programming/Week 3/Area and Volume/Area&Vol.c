/* This is a program that will calculate and display the surface area and volume of a cube
Author: Daniel Tilley
Date: 30/09/2014
*/

#include <stdio.h> 
main()
{
    float h,l,w,surfa,vol;
    
    h=10;
    l=11.5;
    w=2.5;
    surfa=0;
    vol=0;
    
    surfa = (h*l)*2 + (l*w)*2 + (h*w)*2;
    
    printf("Surface area of cube is %fcm\n",surfa);
    
    vol= h*l*w;
    
    printf("Volume of cube is %fcm",vol);
    
    getchar();
    
}//endmain
    
    