/*/* This is a program thst uses a switch statement and ask the user to enter in a number
which represents the day and displays it back as a word
Author: Daniel Tilley
Date: 14/10/14
*/

#include <stdio.h>
main()
{
    
    int var;
    
    var=0;
    
    printf("Please enter a number between 1 ans 7 to represent the day\n");
    scanf("%d",&var);
    
    flushall();
    
    switch(var)
    {
        case(1):
        {
            printf("\nYou have entered Sunday");
            break;
        }//end case '1'
        
        case(2):
        {
            printf("\nYou have entered Monday");
            break;
        }//end case '2'
        
        case(3):
        {
            printf("\nYou have entered Tuesday");
            break;
        }//end case '3'
        
        case(4):
        {
            printf("\nYou have entered Wednesday");
            break;
        }//end case '4'
        
        case(5):
        {
            printf("\nYou have entered Thursday");
            break;
        }//end case '5'
        
        case(6):
        {
            printf("\nYou have entered Friday");
            break;
        }//end case '6'
        
        case(7):
        {
            printf("\nYou have entered Saturday");
            break;
        }//end case '7'
        
        default:
        {
            printf("\nerror: invalid input");
            break;
        }//end default
        
    }//end switch
    
    getchar();
    
}//end main
