/*  This is a program that asks the user to enter an integer between 1 and 100, checks 
whether the integer is even or odd and print a message on the screen stating "Number 
x is Even" or "Number y is Odd".
Author: Daniel Tilley
Date: 07/10/2014
*/

#include <stdio.h>
main()
{
    int v1;
    v1=0;
    
    printf("please enter an integer between 1 and 100\n");
    scanf("%d",&v1);
    
   if ( v1%2 == 0 )
      printf("\nNumber is even\n");
   else
      printf("\nNumber is odd\n");
    
    getchar();
    getchar();
    
}//endmain
    