/* Pass by Reference. Write a program that uses 2 functions (1 function to calculate the
area of a Square, another function to calculate the area of a Circle). Declare a variable
in your main for the length of a side of the Square and another variable for the Radius
of the Circle. Ask the user to enter these values. Using Pass by Reference, pass these
as parameters to the separate functions, calculate the areas of the Square and Circle in
their separate function, and display the results in your main(). Remember, you must
use Pass by Reference. Do not forget to declare 2 prototypes for your 2 functions.
You can assume the value of pi = 3.14
Author: Daniel Tilley 
Date: 10/02/2015
*/

#include <stdio.h>
#define PI 3.14

void circle( float *p);
void square( float *p1);

main()
{
    
    float lenght_square=0;
    float radius=0;
    
    printf("Please enter the radius of the circle: ");
    scanf("%f",&radius);
    
    printf("Please enter the lenght of the square: ");
    scanf("%f",&lenght_square);
    flushall();
    
    circle(&radius);
    square(&lenght_square);
    
    printf("\nArea of the circle is % .2f",radius);
    printf("\nArea of the square is % .2f",lenght_square);
    
    getchar();
    
}//end main

void circle(float *p)
{
    *p=(*p)*(*p)*(PI);
}// end area_c

void square(float *p1)
{
    *p1=(*p1)*(*p1);
}//end area_s
    
    
    
    
    