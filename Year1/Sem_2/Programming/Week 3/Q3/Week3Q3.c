/* Write a program that uses a function to check for
the highest value of 3 numbers. You should enter the 3 numbers using main() and
these should be passed to your function. Your function should find the highest of
these numbers and return it back to main(). Your main() should then display this
highest number.
Author: Daniel Tilley 
Date: 03/02/2015
*/

#include <stdio.h>

#include <stdio.h>
int big_num(int,int,int);

main()
{
    int num1=0;
    int num2=0;
    int num3=0;
    int bigger;
    
    printf("Please enter 3 integers:\n");
    scanf("%d",&num1);
    scanf("%d",&num2);
    scanf("%d",&num3);
    flushall();
    
    bigger=big_num(num1,num2,num3);
    
    printf("\nThe biggest number is %d",bigger);
    getchar();
    
}//end main()

int big_num(int num1x,int num2x, int num3x)
{
    int big=num1x;
    
    //big numbers
    if (num2x > big)
    {
        big=num2x;
    }//end if
    
    if (num3x > big)
    {
        big=num3x;
    }//end if
    
    return big;
}//end big()
