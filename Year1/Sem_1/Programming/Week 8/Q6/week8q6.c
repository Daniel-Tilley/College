/* Write a program to read numbers into an array of 3 integers. Your program must sort 
the array in ascending order (i.e. the first element is the smallest and each element 
after the first is greater than or equal to the element before it).
Author: Daniel Tilley
Date: 4/11/2014
*/

#include <stdio.h>
#define SIZE 3
main()
{
    
    int array[SIZE];
    int i;
    
    //read in values
    printf("Please enter integer values:\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&array[i]);
    }
    
    if (array[0]>array[1]&&array[0]>array[2])
    {
        //display values
        printf("The values in order are:\n");
        for (i=0 ; i<SIZE ; i++)
        {
            printf("%d",array[i]);
        }//end inner for
    }//end if
    
    if (array[1]>array[0]&&array[1]>array[2])
    
    