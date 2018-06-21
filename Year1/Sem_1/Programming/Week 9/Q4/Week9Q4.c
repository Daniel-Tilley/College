/* Chapter 7 - Q5
Author: Daniel Tilley
Date: 11/11/14
*/ 

#include <stdio.h>
#define SIZE 5
main()
{
    
    int array1[SIZE]={0};
    int array2[SIZE]={0};
    int array3[SIZE]={0};
    int i=0;
    
    printf("enter values into first array\n");
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&array1[i]);
        flushall();
    }//end for
    
    printf("\nenter values into second array\n");
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&array2[i]);
        flushall();
    }//end for
    
    printf("\nThe values multiplied are:\n");
    for (i=0 ; i<SIZE ; i++)
    {
        array3[i]=(array1[i]*array2[i]);
        printf("\n%d",array3[i]);
    }//end for 
    
    getchar();
    
}//end main