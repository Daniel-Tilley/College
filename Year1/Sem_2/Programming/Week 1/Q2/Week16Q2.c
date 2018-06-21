/* This is a program that uses DMA to specify the number of elements in an array,
display them and then displap the sum of them
Author: Daniel Tilley
Date: 20/01/2015
*/

#include <stdio.h>
#include <stdlib.h>
main()
{
    int *ptr;
    int num_els;
    int num_bytes;
    int ans;
    int i;
    
    printf("Please enter the number of elements\n");
    scanf("&d",num_els);
    
    //calculate size of memory 
    num_bytes=num_bytes*sizeof(num_els);
    
    //allocate memory 
    ptr=(int*)malloc(num_bytes);
    
    //check if successful 
    if (ptr==NULL)
    {
        printf("Cannot allocate memory");
    }
    
    else
    {
        for( i=0 ; i<num_els ; i++)
        {
            scanf("%d",*(ptr+i));
        }//end for 
    
        //display the data
        for (i=0 ; i<num_els ; i++)
        {
            printf("\n%d",*(ptr+i));
        }//end for
        
        //add the sum of the numbers
        for(i=0; i<num_els ; i++)
        {
            ans=ans+*(ptr+i);
        }//end for
    
        //print sum
        printf("\n%d",ans);
        
        //release memory 
        free(ptr);
    }//end else
    
    flushall();
    getchar();
    
}//end main
    
    
    