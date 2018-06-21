/* Write a program declaring an integer (num1), a character (char1) and 2 pointers (ptr1
that points to an integer and ptr2 that points to a character). 
Initialise num1 and char1 to contain an integer and character. Initialise ptr1 to point to 
num1 and ptr2 to point to char1. Your program should do the following:
a) Print the contents and address of num1 and char1 (on separate lines).
b) Print the contents of ptr1 and ptr2. (The output should be the same as the addresses 
of num1 and char1 above).
c) Using the indirection operator, print the contents of the addresses stored in ptr1
and ptr2.
Do ptr1 and ptr2 have address locations? Check and see, i.e. print the address of ptr1
and ptr2.
Try changing the delimiters (i.e. output type) in your printf statements (i.e. %d, %c, 
%p) and see what happens.

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
    
    printf("Num1 is %d\n",num1);
    printf("Char1 is %c\n",char1);
    
    printf("\nPtr1's address is %p\n",ptr1);
    printf("Ptr2's address is %p\n",ptr2);
    
    printf("\n*Ptr1 contains %d\n",*ptr1);
    printf("*Ptr2 contains %c\n",*ptr2);
    
    getchar();
    
}//end main
    
    
    
    
    