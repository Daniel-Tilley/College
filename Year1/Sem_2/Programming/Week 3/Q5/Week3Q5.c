/* Pass by Value. Write a program to demonstrate the use of Pass by Value with a
function. Begin by creating an integer variable in your main() and initialise it to 1.
Print this value here. Next, call your function and pass this variable as a parameter to
the function. Increment the parameter in your function by 2 and print this value. Your
function should end here and control passed back to your main(). Print the value of
the variable in your main() again and 
Author Daniel Tilley 
Date 16/02/2015
*/

#include <stdio.h>

void some_function(int);

main()
{
    
    int num=1;
    
    printf("\nNum in main is %d",num);
    
    some_function(num);
    
    printf("\nNum in main after call is %d",num);
    
    getchar();
}//end 

void some_function(int num1)
{
    
    num1=num1+2;
    
    printf("\nNum in function is %d",num1);
}//end 
    
    
    
    

