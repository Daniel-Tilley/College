/* Write a program that asks the user to enter 2 integer values. Store these in variables 
called num1 and num2 respectively. Using pointers only, find the sum of these 
numbers, store them in a third variable called sum, and display this value stored in 
variable sum. (Hint: the indirection operator will be used to perform most of your 
task). NB - don't forget that you will need 3 pointer variables.

Author: Daniel Tilley 
Date: 25/11/14
*/

#include <stdio.h>

main()
{
    
    int num1=0;
    int num2=0;
    int sum=0;
    
    int *ptr1=&num1;
    int *ptr2=&num2;
    
    printf("Please eneter 2 values into two integers\n");
    
    printf("The first value is:\n");
    scanf("%d",&num1);
    flushall();
    
    printf("\nThe second value is:\n");
    scanf("%d",&num2);
    flushall();
    
    sum=*ptr1+*ptr2;
    
    printf("\nThe sum of the two values is:\n%d",sum);
    
    getchar();
}//end main
    