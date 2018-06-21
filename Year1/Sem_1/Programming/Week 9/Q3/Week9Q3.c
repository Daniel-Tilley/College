/* Chapter 7 - Q4 
Author: Daniel Tilley
Date: 11/11/14
*/ 

#include <stdio.h>
#define SIZE 15
main()
{
    
    int array[SIZE]={0};
    int i=0;
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&array[i]);
        flushall();
    }
    
    printf("\n\nThe correct order:");
    for (i=0 ; i<SIZE ; i++)
    {
        printf("\n%d",array[i]);
    }
    
    printf("\n\nreverse order:");
    for (i=14 ; i>-1 ; i--)
    {
        printf("\n%d",array[i]);
    }
    
    getchar();
    
}//end main
    
    
    
    
    