/* Write a program that uses a 3x2 (2-D) array. Your program must do the following:
a) Enter values into the array
b) Display the values in the array
c) Find the smallest & largest value and display these
d) Calculate the average of the values and display this
Author: Daniel Tilley
Date: 11/11/14
*/

#include <stdio.h>
#define ROW 3
#define COL 2

main()
{
    
    int array[ROW][COL];
    int i=0;
    int j=0;
    int avg=0;
    int total=0;
    int largest=0;
    int smallest=0;
    
    printf("Please enter your values into the array\n");
    
    //scan in values 
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            scanf("%d",&array[i][j]);
            flushall();
        }//end inner for
    }//end for
    
    
    //displaying values 
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            printf("\n%d",array[i][j]);
        }//end inner for
    }//end for
    
    //calculating largest and smallest values
    
    
    //Calculating average
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            total=total+array[i][j];
        }//end inner for
    }//end for
    
    avg=total/6;
    
    printf("\n\nThe average is:\n%d",avg);
    
    getchar();
    
}//end main