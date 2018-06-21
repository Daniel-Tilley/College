/* Write a program that uses a 3x2 array. Your program must do the following:
a) Enter in values for each element in the array.
b) Calculate and display the sum of row 0, row 1, and row 2 separately.
c) Calculate and display the sum of column 0 and column 1 separately.
d) Find the highest number in the array and display it.
NOTE: I advise you to work the solution for this program on paper first. Do not hack 
code to solve this question.
Author: Daniel Tilley 
Date: 18/11/14
*/

#include <stdio.h>
#define ROW 3
#define COL 2
main()
{
    
    int array[ROW][COL]={{0},{0},{0}};
    int i=0;
    int j=0;
    int sum=0;
    int big=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            scanf("%d",&array[i][j]);
            flushall();
        }//end inner for 
    }//end for 
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            sum=(sum+array[0][j]);
        }//end inner for 
    }//end for 
    
    printf("\nThe sum of row 0 is %d",sum);
    sum=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            sum=(sum+array[1][j]);
        }//end inner for 
    }//end for 
    
    printf("\nThe sum of row 1 is %d",sum);
    sum=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            sum=(sum+array[2][j]);
        }//end inner for 
    }//end for 
    
    printf("\nThe sum of row 2 is %d\n",sum);
    sum=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            sum=(sum+array[i][0]);
        }//end inner for 
    }//end for 
    
    printf("\nThe sum of column 0 is %d",sum);
    sum=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
            sum=(sum+array[i][1]);
        }//end inner for 
    }//end for 
    
    printf("\nThe sum of column 1 is %d",sum);
    sum=0;
    
    for (i=0 ; i<ROW ; i++)
    {
        big=array[i][0];
        if (array[i][0]>big)
        {
            big=array[i][0];
        }//end if 
    }//end for 
    
    for (i=0 ; i<ROW ; i++)
    {
        big=array[i][1];
        if (array[i][1]>big)
        {
            big=array[i][1];
        }//end if 
    }//end for 
    
    printf("\n\nThe Biggest Number is %d",big);

    getchar();
    
}//end main
    
    
        