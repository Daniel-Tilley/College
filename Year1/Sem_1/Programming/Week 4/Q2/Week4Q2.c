/* This is a program that asks the user to enter 2 characters and displays these on the screen using
scanf and printf.
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
    scanf("%1s%1s",&v1,&v2);
    printf("\nThe Characters you have entered are: \n%c\n%c",v1, v2);

    
    getchar();
    getchar();
    
}//endmain
    