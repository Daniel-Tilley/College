/* Write a program that uses 2 float variables called input1 and input2. Enter values 
for these variables. Using pointers (called ptr1 and ptr2), your program should do 
the following:
a) Print the address of input1 and input2 (on separate lines).
b) Print the address of ptr1 and ptr2 (on separate lines) - Remember, even though 
these are pointers, they are still variables. Therefore, each will also have their 
own address in memory.
c) Make ptr1 and ptr2 point to input1 and input2 respectively. Print the contents of 
ptr1 and ptr2. (The output should be the same as the addresses of input1 and 
input1 above).
d) Using the indirection operator, print the contents of the address stored in ptr1
and ptr2.

Author: Daniel Tilley
Date: 25/11/14
*/

#include <stdio.h>

main()
{
    float input1=1.01612712;
    float input2=2.13476136;
    
    float *ptr1;
    float *ptr2;
    
    printf("\nPtr1's address is %p\n",ptr1);
    printf("Ptr2's address is %p\n",ptr2);
    
    printf("\nInput1 has an address of %p\n",input1);
    printf("Input2 has an address of %p\n",input2);
    
    *ptr1=input1;
    *ptr2=input2;
    
    printf("\n*Ptr1 contains %f\n",*ptr1);
    printf("*Ptr2 contains %f\n",*ptr2);
    
    getchar();
    
}//end main