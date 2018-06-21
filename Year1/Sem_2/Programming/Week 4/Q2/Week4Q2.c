/* Passing 1-D Array. Write a program that uses a function to find the highest number in
an array containing 5 numbers. In the main(), you must ask the user to enter 5
numbers and store these in the array. Pass the array to a function and your function
must find the highest number. Return this number to your main() and display it
Author: Daniel Tilley 
Date: 0/02/2015
*/

#include <stdio.h>
#define SIZE 5

int high_array(int array[SIZE]);

main()
{
    
    int array[SIZE]={0};
    int i;
    int high_value;
    
    printf("Please enter %d elements into the array:\n",SIZE);
    
    for(i=0; i<SIZE; i++)
    {
        scanf("%d",&array[i]);
    }//end for 
    
    flushall();
    
    high_value=high_array(array);
    
    printf("\nThe biggest value is %d",high_value);
    
    getchar();
}//end main

int high_array( int array[])
{
    
    int i;
    int big;
    
    for(i=0; i<SIZE; i++)
    {
        if(array[i]>(array[i-1]))
        {
            big=array[i];
        }//end if 
    }//end for 
    
    return big;
}//end high_array
    