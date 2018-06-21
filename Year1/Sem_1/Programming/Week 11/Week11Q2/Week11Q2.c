/* Modify your program (Q1) above to do the following:
a) Declare a third pointer ptr3 that points to an integer. Initialise this to point to 
char1. Does this compile? If not, why?
b) Using the indirection operator, print the contents of the address stored in ptr3
with %d and %c. Is there a difference? If yes, explain what this difference is 
(include as a comment in your code).

Author: Daniel Tilley
Date: 25/11/14
*/



#include <stdio.h>

main()
{
    
    int num1=3;
    char char1='a';
    
    int *ptr1=&num1;
    char *ptr2=&char1;
    int *ptr3=&char1;
    
    printf("Num1 is %d\n",num1);
    printf("Char1 is %c\n",char1);
    
    printf("\nPtr1's address is %p\n",ptr1);
    printf("Ptr2's address is %p\n",ptr2);
    
    printf("\n*Ptr1 contains %d\n",*ptr1);
    printf("*Ptr2 contains %c\n",*ptr2);
    printf("*Ptr3 contains %d\n",*ptr3);
    
    getchar();
    
}//end main

//does not work
