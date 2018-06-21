/* This is a program that uses a loop to print out all the even numbers from 1 - 100, separated by commas 
Author: Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int i=0;
    int ans=0;
    
    for ( i=1 ; i<100 ; i++ )
    {
        if (i%2==1)
        {
            ans=ans+i;
        }//end if
    }//end for
               
    printf("The sum of all odd number between 1 and 99 is %d",ans);

    getchar();
    
}//endmain