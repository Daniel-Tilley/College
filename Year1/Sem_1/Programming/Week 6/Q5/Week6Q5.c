/* This is a program that uses a loop to print out all the even numbers from 1 - 100, separated by commas 
Author: Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int i=0;
    
    for ( i=1 ; i<101 ; i++ )
    {
        if (i%2==0)
        {
            printf("%d\n",i);
        }//end if
    }//end for
    
    getchar();
    
}//endmain