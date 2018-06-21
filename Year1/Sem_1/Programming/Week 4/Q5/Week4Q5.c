/* This is a program that asks the user to enter 2 characters and displays these on the screen using
getchar amd putchar.
Author: Daniel Tilley
Date: 07/10/2014
*/

#include <stdio.h>
main()
{
    
    char v1, v2;
    v1=' ';
    v2=' ';
    
    printf("Please enter 2 characters\n");
    v1 = getchar();
    v2 = getchar();
    
    printf("\nThe Characters you have entered are:\n");
    putchar(v1);
    putchar(v2);

    getchar();
    getchar();
    
}//endmain
    