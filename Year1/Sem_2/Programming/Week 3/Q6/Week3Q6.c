/* Pass by Reference. Write a program similar to Q5 but this time use Pass by Reference
to modify the integer variable declared in main().
Author: Daniel Tilley
Date: 16/02/2015
*/

#include <stdio.h>

void some_function(int *p);

main()
{
    
    int num=1;
    
    printf("\nNum in main is %d",num);
    
    some_function(&num);
    
    printf("\nNum in main after call is %d",num);
    
    getchar();
}//end 

void some_function(int *p)
{
    
    *p=*p+2;
    
    printf("\nNum in function is %d",*p);
}//end 