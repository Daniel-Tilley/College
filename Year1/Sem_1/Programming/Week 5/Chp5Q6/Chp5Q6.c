/*/* This is a program thst uses a switch statement and ask the user to enter in a number
and displays it back as a word
Author: Daniel Tilley
Date: 14/10/14
*/

#include <stdio.h>
main()
{
    
    int var;
    
    var=0;
    
    printf("Please enter a number between 1 ans 9\n");
    scanf("%d",&var);
    
    flushall();
    
    switch(var)
    {
        case(1):
        {
            printf("\nYou have entered one");
            break;
        }//end case '1'
        
        case(2):
        {
            printf("\nYou have entered two");
            break;
        }//end case '2'
        
        case(3):
        {
            printf("\nYou have entered three");
            break;
        }//end case '3'
        
        case(4):
        {
            printf("\nYou have entered four");
            break;
        }//end case '4'
        
        case(5):
        {
            printf("\nYou have entered five");
            break;
        }//end case '5'
        
        case(6):
        {
            printf("\nYou have entered six");
            break;
        }//end case '6'
        
        case(7):
        {
            printf("\nYou have entered seven");
            break;
        }//end case '7'
        
        case(8):
        {
            printf("\nYou have entered eight");
            break;
        }//end case '8'
        
        case(9):
        {
            printf("\nYou have entered nine");
            break;
        }//end case '9'
        
        default:
        {
            printf("\error: invalid input");
            break;
        }//end default
        
    }//end switch
    
    getchar();
    
}//end main

