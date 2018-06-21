/* This is a program that uses an array to read in 5 numbers and copies the contents of this 
array into another array.
Author: Daniel Tilley
Date: 4/11/14
*/

#include <stdio.h>
#define SIZE 5
main()
{
    
    int nums[SIZE];
    int copy[SIZE];
    int i;
    
    //read in values into array
    printf("Please enter five values into the array\n");
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d", &nums[i]);
    }//end for
    
    flushall();
    
    //copy contents of first array into second array
    printf("The numbers you have entered are:\n");
    for (i=0 ; i<SIZE ; i++)
    {
        copy[i]=nums[i];
        printf("%d\n",copy[i]);
    }//end for
    
    getchar();
    
}//end main
    
    
    
        
