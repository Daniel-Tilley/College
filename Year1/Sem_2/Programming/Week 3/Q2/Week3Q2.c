/* Write a program that uses a function to calculate
the average of 3 numbers. Your main() should ask the user to enter these 3 numbers
and they should be passed to the function as parameters. Your function should
calculate the average and return this value back to the main(). Your main() should
then display this average value. 
Author: Daniel Tilley 
Date: 03/02/2015
*/

#include <stdio.h>
#define SIZE 3

float average(int,int,int);//prototype 

main()
{
    
    int num1=0;
    int num2=0;
    int num3=0;
    float avg1;
    
    printf("Please enter 3 numbers:\n");
    scanf("%d",&num1);
    scanf("%d",&num2);
    scanf("%d",&num3);
    flushall();
    
    avg1=average(num1,num2,num3);
    
    printf("The average is % .2f",avg1);
    
    getchar();
}//end main()

float average(int x, int y, int z)
{
    
    float avg;
    
    avg=((x+y+z)/3);
    
    return avg;
}//end average()
    
