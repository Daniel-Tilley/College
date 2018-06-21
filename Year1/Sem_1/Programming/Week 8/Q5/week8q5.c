/* Write a program that uses a char array with 5 elements. Enter any 5 characters of your 
choice into the array. Output the contents of the array to the screen and display each 
character.
Author: Daniel Tilley
Date: 4/11/2014
*/

#include <stdio.h>
#define SIZE 5
main()
{
    
    char array[SIZE];
    int i;
    
    //input the characters into array
    printf("Please enter 5 characters into the array\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%1s",&array[i]);
    }//end for 
    
    flushall();
    
    //display the characters back 
    printf("The characters you have entered are:\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        printf("%c",array[i]);
    }//end for 
    
    getchar();
    
}//end main
    
    