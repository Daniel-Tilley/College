/* This is a program that uses an array to allow the user to input 3 temperature 
readings in Fahrenheit. After all the temperatures have been read from the keyboard, 
it displays each of these temperatures on the screen and its corresponding temperature in 
Celsius
Author: Daniel Tilley
Date: 4/11/14
*/

#include <stdio.h>
#define SIZE 3
main()
{
    int fah[SIZE];
    int cel[SIZE];
    int temp[SIZE];
    int i;
    
    //Enter values into array
    printf("Please enter the fahrenheit values into the array\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&fah[i]);
    }//end for
    
    flushall();
    
    //convert values to celsius
    printf("The converted values are:\n");
    for (i=0 ; i<SIZE ; i++)
    {
        cel[i]=fah[i];
        printf("%d fahrenheit is %d celsius\n",&fah[i],cel[i]);
    }//end for
    
    getchar();
    
}//end main
    
    
        
        