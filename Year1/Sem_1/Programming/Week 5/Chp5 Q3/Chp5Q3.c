/*  This is a program that asks the user to enter two integers, checks whether the first integer 
is evenly divisible by the second or not and prints a message on the screen stating 
"Number x is divisible by number y" or "Number x is divisible by number y".
Author: Daniel Tilley
Date: 14/10/2014
*/

#include <stdio.h>
main()
{
    int v1;
    int v2;
    
    v1=0;
    v2=0;
    
    printf("please enter 2 integers\n");
    scanf("%d%d",&v1,&v2);
    
    flushall();
    
   if ( v1%v2 == 0 )
   {
       printf("\Number: %d is divisible by number: %d\n",v1,v2);
   }
   else
   {
       printf("\Number: %d is not divisible by number: %d\n",v1,v2);
   }
    
    getchar();
    
}//endmain
    