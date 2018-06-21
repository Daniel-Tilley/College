/* This is a program that asks the user to enter 3 float numbers (numbers with a decimal part). 
Display the 1st correct to 4 decimal places, the 2nd correct to 3 decimal places, and the 3rd with no
decimal places on separate lines.
Author: Daniel Tilley
Date: 07/10/2014
*/

#include <stdio.h>
main()
{
    
    float v1,v2,v3;
    v1=v2=v3=0;
    
    printf("Please enter 3 decimal numbers e.g 2.468\n");
    scanf("%f%f%f",&v1,&v2,&v3);
    printf("\nThe numbers you have entered are \n% .4f\n% .3f\n% .0f",v1 ,v2 ,v3);
    
    getchar();
    getchar();
    
}//endmain
