/*Write a program that uses a function to find the highest and lowest number of 3
values. These 3 values must be passed as parameters to the function, i.e.
function_name(int, int, int). Your function should find these values and display
messages stating:
The Highest value is x
The Lowest value is y
Author: Daniel Tilley 
Date: 27/01/2015
*/

#include <stdio.h>
void big_or_small(int,int,int);

main()
{
    int num1=0;
    int num2=0;
    int num3=0;
    
    
    printf("Please enter 3 integers:\n");
    scanf("%d",&num1);
    scanf("%d",&num2);
    scanf("%d",&num3);
    flushall();
    
    big_or_small(num1,num2,num3);
    getchar();
    
}//end main()

void big_or_small(int num1x,int num2x, int num3x)
{
    int big=num1x;
    int small=num1x;
    
    //big numbers
    if (num2x > big)
    {
        big=num2x;
    }//end if
    
    if (num3x > big)
    {
        big=num3x;
    }//end if
    
    //small numbers
    if (num2x < small)
    {
        small=num2x;
    }//end if
    
    if (num3x < small)
    {
        small=num3x;
    }//end if
    
    printf("\nThe big number is: %d\n",big);
    printf("\nThe small number is: %d\n",small);
    flushall();
    
    getchar();
}//end big_or_small()

    
    
    
