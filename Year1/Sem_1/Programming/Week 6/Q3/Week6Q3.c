/* This is a program that asks the user to enter a number between 1 - 5. The program 
will display all the numbers between 1 - 20 that are evenly divisible by this 
number.
Author: Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int v1=0;
    int i=0;
    
    printf("Please enter a number between 1 and 5\n");
    scanf("%d",&v1);
    
    if (v1>=1 && v1<=5)
    {
        
        for (i=1 ; i <=20 ; i++)
        {
            if (i%v1==0)
            {
                printf("%d is divisible by %d\n",i,v1);
            }//end if
        
            else 
            {
                printf("%d is not divisible by %d\n",i,v1);
            }//end else
        }//end for
    }//end if
    
    else 
    {
        printf("Error, the number you have eneterd is not between 1 and 5, please enter a number again\n");
        scanf("%d",&v1); 
        
        for (i=1 ; i <=20 ; i++)
        {
            if (i%v1==0)
            {
                printf("%d is divisible by %d\n",i,v1);
            }//end inner if
        
            else 
            {
                printf("%d is not divisible by %d\n",i,v1);
            }//end inner else
        }//end for
    }//end else
    
    getchar();
    getchar();
    
}//end main
    
    
    
    