/* Write a program that uses a function to print 10 stars (*) on a single line. Ensure you
declare your function prototype and include adequate comments.
Author: Daniel Tilley 
Date: 27/01/2015
*/

#include <stdio.h>

void stars(void);

main()
{
    
    stars();
    getchar();
    
}//end main 

void stars()
{
    int i;
    
    for (i=0; i<11; i++)
    {
        printf("*");
    }//end for
    
}//end stars 
        