/* Chapter 7 - Q9
Author: Daniel Tilley
Date: 11/11/14
*/ 

#include <stdio.h>
#define ROW 4
#define COL 5
main()
{
    
    int array[ROW][COL];
    int i=0;
    int j=0;
    int count_row=0;
    int count_col=0;
    
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
    
    //check for value >0
    for (i=0 ; i<ROW ; i++)
    {
        count_row++;
        for (j=0 ; j<COL ; j++)
        {
            count_col++;
            if (array[i][j]<0)
            {
                printf("\nThe number %d from row %d and column %d is less than 0",array[i][j],count_row,count_col);
            }//end if
        }//end inner for
    }//end for
    
    getchar();
    
}//end main
    