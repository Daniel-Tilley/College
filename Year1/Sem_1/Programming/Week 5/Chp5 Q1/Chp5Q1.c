/* This is a program thst uses a switch statement and ask the user to enter in their 
relationship status and shows it back to them
Author: Daniel Tilley
Date: 14/10/14
*/

#include <stdio.h>
main()
{
    
    char r_status;
    
    printf("Please enter your relationship status using one letter e.g s for single\n");
    scanf("%1s",&r_status);
    
    flushall();
    
    switch(r_status)
    {
        case'S':
        case's':
        {
            printf("\nYou are single",r_status);
            break;
        }//end case 'a'
        
        case'M':
        case'm':
        {
            printf("\n%cYou are married",r_status);
            break;
        }//end case 'e'
        
        case'W':
        case'w':
        {
            printf("\n%cYou are widowed",r_status);
            break;
        }//end case 'i'
        
        case'E':
        case'e':
        {
            printf("\n%cYou are seperated",r_status);
            break;
        }//end case 'o'
        
        case'D':
        case'd':
        {
            printf("\n%cYou are divorced",r_status);
            break;
        }//end case 'u'
        
        default:
        {
            printf("\error: invalid code");
            break;
        }//end default
        
    }//end switch
    
    getchar();
    
}//end main
