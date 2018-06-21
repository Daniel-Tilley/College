/* This program creates an array with 4 integers and then displays these on the screen 
in the same order they were entered. The program then swaps the 1st and 2nd numbers in the 
array and swaps the 3rd and 4th numbers in the array. Then your program displays the 
numbers on the screen using this new order.
Author: Daniel Tilley
Date: 4/11/2014
*/

#include <stdio.h>
#define SIZE 4
main()
{
    
    int nums[SIZE];
    int temp=0;
    int i=0;
    
    //read values into array
    printf("Please enter 4 integer into the array\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        scanf("%d",&nums[i]);
    }//end for
    
    flushall();
    
    //display values in array
    printf("The values you have entered are\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        printf("%d\n",nums[i]);
    }//end for 
    
    //re-arrange values 1 and 2
    temp=nums[0];
    nums[0]=nums[1];
    nums[1]=temp;
    
    //re-arrange values 3 and 4
    temp=nums[2];
    nums[2]=nums[3];
    nums[3]=temp;
    
    //print re-arranged numbers 
    printf("The numbers re-arranged are:\n");
    
    for (i=0 ; i<SIZE ; i++)
    {
        printf("%d\n",nums[i]);
    }//end for 
    
    getchar();
    
}//end main
    
    
    
    
        
        
        