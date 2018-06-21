/* This program that will input a positive integer value, and compute the following 
sequence. If the number is even, halve it; if it is odd, multiply by 3 and add 1.
Repeat this process until the value is 1, printing out each value. Finally print out how 
many of these operations you performed. 
Author: Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int v1=0;
    int counter=0;
    
    printf("please enter a positive integer\n");
    scanf("%d",&v1);
    
    printf("Initial value is %d\n",v1);
    
    while (v1!=1)
    {
        if (v1>0)
        {            
            if (v1%2==0)
            {
                v1=v1/2;
                printf("The next value is %d\n",v1);
            }//end inner if
            
            else
            {
                v1=((v1*3)+1);
                printf("The next value is %d\n",v1);
            }//end inner else
        }//end if
        
        else 
        {
            printf("Error, the number you have eneterd is not positive, please try again\n");
            scanf("%d",&v1);
        }//end else
        
        counter++;
        
    }//end while
    
    printf("The number of steps is %d",counter);

    getchar();
    getchar();
    
}
    
            
            