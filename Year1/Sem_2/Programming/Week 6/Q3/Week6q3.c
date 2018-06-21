/* Write a program to display how a character array (e.g. char my_word[]) can be
initialised with a string. Try both ways, i.e. (1) initialising each element of the array
with a specific character & (2) initialise the array automatically with a string in
double-quotes. What happens if you initialise each element of the array and do not
include the null character? Print the string and see.
Print out the contents of the array. Does the null character get printed? Try printing
the null character after the last letter in the string - what is displayed?
Change your code and test it to see the different ways you can output the contents of
the character array as a string.
Author: Daniel Tilley 
Date: 24/02/2015
*/

#include <stdio.h>
#define SIZE 6

main()
{
    
    char string[SIZE]={'H','e','l','l','o','\0'};
    char string2[SIZE]="Hello";

    printf("%s\n",string);
    printf("%s\n",string2);
    
    getchar();
    
}//end main
