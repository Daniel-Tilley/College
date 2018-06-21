/* This is a program that implements the Fibonacci series
Author: Daniel Tilley 
Date: 09/02/2015
*/

#include <stdio.h>

main()
{
    
    int term=0; //term in series 
    int num1=1; int num2=0; //numbers in the series 
    int i; //counter value in loop
    int next_value; //variable to print the next number
    
    //ask the user to enter the number of elements 
    printf("Please enter the number of elements you wish to display: ");
    scanf("%d",&term);
    flushall();
    
    //display message 
    printf("\nThe numbers in the series are as follows:\n");
    
    //for loop to print series and to compute the series
    for (i=1; i<term; i++)
    {
        //if statement to print zero
        if (num2==0)
        {
            printf("\nElement 0 is: 0\n");
        }//end if
        
        next_value=num1+num2;
        num1=num2;
        num2=next_value;
        
        printf("Element %d is: %d\n",i,next_value);
    }//end for
    
    //keeps the program open
    getchar();
}//end main
    
    