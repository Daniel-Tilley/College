/* Write a program that uses a function with 2 parameters (a character and an integer,
e.g. function_name(char, int). Your function must display the character parameter a
certain number of times on one line where this number is the integer parameter. For
example, if your function is function_name(*,5) it will display *****
Author: Daniel Tilley 
Date: 27/01/2015
*/

#include <stdio.h>

void data(int,char);
 
main()
{
    int num1=0;
    char var1=' ';

    printf("Please enter the character you wish to display:");
    scanf("%1s",&var1);
    
    printf("\nPlease enter the number of times you wish to display the character:");
    scanf("%d",&num1);
    flushall();

    data(num1,var1);
    
}//end main()

void data(int num,char var)
{
    
    int i=0;
    
    for (i=0; i<num; i++)
    {
        printf("%c",var);
    }//end for 
    
    getchar();
}//end data()