/* Write a program that defines an integer array with 5 elements. Your program must do 
the following:
a) read in 5 values into the array
b) define another integer array with 5 elements and copy the values from the 1st 
array into the second array in reverse order (e.g. the number in the first 
element of the 1st array will be in the last element in the 2nd array, etc..).
Author: Daniel Tilley
Date: 4/11/2014
*/

#include <stdio.h>
#define SIZE 4
main()
{
    
    int nums1[SIZE];
    int nums2[SIZE];
    int i=0;
    int ii=3;
    
    //read values into array
    printf("Please enter 4 integer into the array\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&nums1[i]);
    }//end for
    
    flushall();
    
    //display values in array
    printf("The values you have entered are\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        printf("%d\n",nums1[i]);
    }//end for 
    
    //re-arrange values and print them
    printf("The re-arranged values are:\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        nums2[i]=nums1[ii];
        printf("%d\n",nums2[i]);
        ii--;
    }//end for 
    
    getchar();
    
}//end main
    
    
    
    
    
    

