/* This is a program that was covered in lecture class for both malloc() and calloc().
After you run these programs, change the size of the allocated memory to be smaller
than required (i.e. remove the signof(int) and replace it with a hardcode integer
number, as we discussed in lecture class). Compile and run the changed programs.
What happens?
Author: Daniel Tilley 
Date: 20/01/2015
*/

#include <stdio.h>
#include <stdlib.h>
main()
{
    float *ptr, temp_ptr;
    int num_els;
    int i;
    
    printf("Enter the number of elements");
    scanf("&d",num_els);
    
    //alocate memory 
    ptr=(float*)calloc(num_els,sizeof(float));
    
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
        
        //release memory 
        free(ptr);
    }//end else
    
    flushall();
    getchar();
    
}//end main

    
    