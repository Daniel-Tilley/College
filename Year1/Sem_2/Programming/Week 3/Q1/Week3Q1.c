/* Write a program that uses a function to check if a
number is even or odd. Your main() should allow the user to enter any number and
this should be passed to your function. Your function should check if the number is
even or odd and return a 1 if even or a 0 if odd. Your main() should then indicate the
result.
Author: Daniel Tilley 
Date: 03/02/2015
*/

#include <stdio.h>

int odd_or_even(int);//prototype 

main()
{
    
    int num=0;
    int value=0;
    
    printf("Please enter your number:\n");
    scanf("%d",&num);
    flushall();
    
    value=odd_or_even(num);
    
    if(value==0)
    {
        printf("Number is even");
    }//end if 
    
    else 
    {
        printf("Number is odd");
    }//end else 
    
    getchar();
        
}//end main()

int odd_or_even(int num)
{
    
    int res;
    
    num=num%2;
    
    if(num==0)
    {
        res=0;
        return res;
    }//end if 
    
    else 
    {
        res=1;
        return res;
    }//end else 
    
}//end even_or_odd()
    
    