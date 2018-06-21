/* What is in a[8] after the following code is executed?
 for (i = 0; i < 10; i++)
 {
 a[i] = 9 - i;
 }
 for (i = 0; i < 10; i++)
 {
 a[i] = a[ a[i] ];
 }
Include this code in a full program, compile and run it. Display the contents of a[8] to 
see its contents. Do you understand how it works and what is happening.
Author Daniel Tilley 
Date: 11/11/14
*/

#include <stdio.h>
#define SIZE 10

main()
{
    
    int a[SIZE]={0};
    int i=0;
    
    for (i = 0; i < SIZE; i++)
    {
        a[i] = 9 - i;
    }//end for
 
    for (i = 0; i < SIZE; i++)
    {
        a[i] = a[ a[i] ];
    }//end for
    
    printf("%d",a[8]);
    
    getchar();
    
}//end main
    