/* Passing 1-D Array. Write a program that uses a function to calculate the average of 5
numbers in an array. In the main(), you must ask the user to enter 5 numbers and store
these in the array. Pass the array to a function and calculate the average of these 5
numbers. Return the average to your main() and display this.
Author: Daniel Tilley
Date: 16/02/2015
*/

#include <stdio.h>
#define SIZE 5

int average(int array[SIZE]);

main()
{
    
    int array[SIZE]={0};
    int i;
    int avg;
    
    printf("Please enter %d elements into the array:\n",SIZE);
    
    for(i=0; i<SIZE; i++)
    {
        scanf("%d",array+i);
    }//end for 
    
    flushall();
    
    avg=average(array);
    
    printf("\nThe average is %d",avg);
    
    getchar();
}//end main

int average( int arrayx[])
{
    
    int i;
    int avgx;
    
    for(i=0; i<SIZE; i++)
    {
        avgx=avgx+arrayx[i];
    }//end for 
    
    avgx=avgx/SIZE;
  
    return avgx;
}//end high_array
    