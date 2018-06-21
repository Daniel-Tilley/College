/*This is a program that uses a while loop to print out the numbers 1 - 10 in descending
order on the same line and each number is separated by a comma (e.g. 1,2,3,4,5,6,7,8,9,10)
Author : Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int v1=10;
    
    while(v1>0)
    {
        printf("\n%d,",v1);
        v1--;
    }//end while
    
    getchar();
    
}//end main