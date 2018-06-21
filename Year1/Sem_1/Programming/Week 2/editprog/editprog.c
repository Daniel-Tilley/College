/* This is a prgram to correct this line of code

#include <stdio.h>;
main[]
{
/*Program to illustrate errors in a C program.
int i, j;
float i;
j = 40000;
PRINTF("The value of i is %d" i);
PRINT("Size of an integer is %d", sizeof(int));
]

Author: Daniel Tilley
Date: 23/09/2014
*/

#include <stdio.h>
main()
{
    int j;
    float i;
    
    i=20000;
    
    printf("The value of i is %f\n" , i);
    printf("Size of an integer is %d" , sizeof(int));
    getchar();
}
//End Main

