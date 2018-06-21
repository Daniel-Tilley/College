/* This is a program that asks the user to enter 3 numbers and display these on 
separate lines.
Author: Daniel Tilley
Date: 07/10/2014
*/

#include <stdio.h>
main()
{
    
    float v1, v2, v3;
    v1=0;
    v2=0;
    v3=0;
    
    printf("Please enter 3 different numbers\n");
    scanf("%f%f%f",&v1,&v2,&v3);
    printf("\nThe numbers you have enetered are: \n%f\n%f\n%f\n",v1 , v2, v3);
    
    getchar();
    getchar();
    
}//endmain
    
    
    