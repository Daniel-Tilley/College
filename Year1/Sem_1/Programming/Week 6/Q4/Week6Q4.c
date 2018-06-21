/* This is a program that counts from one to ten, prints the values on a separate line for 
each, and prints a message stating "This number is three" and "This number is seven" 
when the count is 3 and when the count is 7 respectively.
Author: Daniel Tilley
Date: 21/10/14
*/

#include <stdio.h>
main()
{
    
    int i=0;
    
    
    for ( i=0 ; i<=10 ; i++ )
    {
        switch(i)
        {
            case(0):
            {
                printf("\nThe number is zero");
                break;
            }//end case '0'
            
            case(1):
            {
                printf("\nThe number is one");
                break;
            }//end case '1'
            
            case(2):
            {
                printf("\nThe number is two");
                break;
            }//end case '2'
            
            case(3):
            {
                printf("\nThe number is three");
                break;
            }//end case '3'
            
            case(4):
            {
                printf("\nThe number is four");
                break;
            }//end case '4'
            
            case(5):
            {
                printf("\nThe number is five");
                break;
            }//end case '5'
            
            case(6):
            {
                printf("\nThe number is six");
                break;
            }//end case '6'
            
            case(7):
            {
                printf("\nThe number is seven");
                break;
            }//end case '7'
            
            case(8):
            {
                printf("\nThe number is eight");
                break;
            }//end case '1'
            
            case(9):
            {
                printf("\nThe number is nine");
                break;
            }//end case '9'
            
            case(10):
            {
                printf("\nThe number is ten");
                break;
            }//end case '10'
        }//end switch
    }//end for
    
    getchar();
    
}//end main