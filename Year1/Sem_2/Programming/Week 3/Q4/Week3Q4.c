/* Write a program that uses a function to calculate
the most commonly used character from a number of 3 characters entered by a user.
Your main() should read the 3 characters and these should be passed to your function.
Your function should calculate the most common character of the 3 (assume the user
enters more than one occurrence of any character). This character should then be
returned to the main(). Your main() should then display this character with an
appropriate message.
Author: Daniel Tilley 
Date: 03/02/2015
*/

#include <stdio.h>

char check (char, char, char);

main()
{
    char v1;
    char v2;
    char v3;
    char most;
    
    printf("Please enter 3 chars:\n");
    scanf("%1s",&v1);
    scanf("%1s",&v2);
    scanf("%1s",&v3);
    flushall();
    
    most=check(v1,v2,v3);
    
    printf("The most common is %c",most);
    
    getchar();
}//end main

char check (char var1,char var2,char var3)
{
    char big;
    
    if(var1==var2 || var1==var3)
    {
        big=var1;
        return big;
    }
    
    if(var2==var1 || var2==var3)
    {
        big=var2;
        return big;
    }
    
    if(var3==var1 || var3==var2)
    {
        big=var3;
        return big;
    }
}//end check