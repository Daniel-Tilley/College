/* This is a program thst uses a switch statement and asks the user to enter a character from
the keyboard and displays a message whether the character is a vowel (a, e, i, o, u) or not.
Author: Daniel Tilley
Date: 14/10/14
*/

#include <stdio.h>
main()
{
    
    char letter;
    
    printf("Please enter a character from the keyboard\n");
    scanf("%1s",&letter);
    
    flushall();
    
    switch(letter)
    {
        case'a':
        case'A':
        {
            printf("\n%c is a vowel",letter);
            break;
        }//end case 'a'
        
        case'e':
        case'E':
        {
            printf("\n%c is a vowel",letter);
            break;
        }//end case 'e'
        
        case'i':
        case'I':
        {
            printf("\n%c is a vowel",letter);
            break;
        }//end case 'i'
        
        case'o':
        case'O':
        {
            printf("\n%c is a vowel",letter);
            break;
        }//end case 'o'
        
        case'u':
        case'U':
        {
            printf("\n%c is a vowel",letter);
            break;
        }//end case 'u'
        
        default:
        {
            printf("\n%c is not a vowel",letter);
            break;
        }//end default
        
    }//end switch

    getchar();
    
}//end main
