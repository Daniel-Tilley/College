/* (Lab Test 1) This is a program that implements the Fibonacci series. The program asks 
the user to enter the number of terms in the series to display and then display all the numbers 
in the series up to that term.
Author: Daniel Tilley
Date: 28/10/2014
*/

#include <stdio.h>

main()
{
    int terms;//number of terms in series
    int i;//counter value for for loop
    int num1;//initial value in series
    
    terms=i=num1=0;
    
    
    printf("The Fibonacci Series is defined as F(n+2) = F(n+1) + F(n)\n");
    printf("Please enter the number of terms you would like to display in the series:\n");
    scanf("%d",&terms);
    flushall();
    
    printf("The list of number in the series are:\n");
    for (i=1 ; i<=terms ; i++)
    {
        num1=num1+1+num1;
        printf("%d\n",num1);
    }//end for
    
    getchar();
    
}//end main
    