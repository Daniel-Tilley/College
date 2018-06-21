/*Complete the following program so that it computes the sum of all the elements in the 
array:
Author: Daniel Tilley 
Date: 18/11/14
*/

#include<stdio.h>
#define ROW 4
#define COL 6
main()
{
    
    int data[ROW][COL]={{1,1,1,1,1,1},{1,1,1,1,1,1},{1,1,1,1,1,1},{1,1,1,1,1,1}};
    int ans=0;
    int i=0;
    int j=0;
 
    for (i=0 ; i<ROW ; i++)
    {
        for (j=0 ; j<COL ; j++)
        {
        ans=ans+data[i][j];
        }//end inner for
    }//end for

    printf("Answer is %d",ans);
    
    getchar();
}//end main