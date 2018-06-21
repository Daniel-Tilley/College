/* This is a program that declares 3 variables and displays them back to the user
Author: Daniel Tilley
Date: 23/9/2014
*/
#include <stdio.h>
main()
{
    int v1;
    float v2;
    char v3;
    
    v1=65;
    v2=-18.23;
    v3='a';
    
    printf(" v1 contains %d\n" , v1);
    printf(" v2 contains %f\n" , v2);
    printf(" v3 contains %c\n" , v3);
    printf(" End Program");
    getchar();
}
//End Main