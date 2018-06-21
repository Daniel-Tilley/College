/* This is a program that will declare variables and display them back to the user
Author: Daniel Tilley
Date: 23/09/2014
*/

#include <stdio.h>
main()

{
    int type1;
    float type2;
    char type3;
    
    type1=2000;
    type2=1234.5678;
    type3='&';
    
    printf(" Type1 has a value of %c\n" , type1);
    printf(" Type2 has a value of %d\n" , type2);
    printf(" Type3 has a value of %f\n" , type3);
    getchar();
}
//End Main