/*  This is a program that asks the user to enter , checks whether the first integer 
is evenly divisible by the second or not and prints a message on the screen stating 
"Number x is divisible by number y" or "Number x is divisible by number y".
Author: Daniel Tilley
Date: 14/10/2014
*/

#include <stdio.h>
main()
{
    int side1;
    int side2;
    int side3;
    
    side1=side2=side3=0;
    
    printf("please enter 3 measurments for sides of a triangle\n");
    scanf("%d%d%d",&side1,&side2,&side3);
    
    flushall();
    
   if (side1<(side2+side3) && side2<(side1+side3) && side3<(side1+side2) )
   {
       printf("\nThis is a valid triangle");
   }
   else
   {
       printf("\nThis is not a valid traingle");
   }
    
    getchar();
    
}//endmain
    