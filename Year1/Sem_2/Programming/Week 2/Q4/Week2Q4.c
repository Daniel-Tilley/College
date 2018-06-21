/* Write a program that uses 2 functions called sum() and average(). Your program must
ask the user to enter 3 numbers inside the main(). Your main() should then pass these
3 values as parameters to the function sum(). This function should calculate the sum
of the 3 numbers. Your function sum() should then pass the sum of the 3 numbers as a
parameter to the function average(). The function average() should then calculate the
average of the 3 numbers and display this on the screen.
Author: Daniel Tilley
Date: 27/01/2015
*/

#include <stdio.h>
int sum(int,int,int);
void average(int);

main()
{
    int num1=0;
    int num2=0;
    int num3=0;
    int total=0;
    
    
    printf("Please enter 3 integers:\n");
    scanf("%d",&num1);
    scanf("%d",&num2);
    scanf("%d",&num3);
    flushall();
    
    total=sum(num1,num2,num3);
    average(total);
    
    getchar();
    
}//end main()

int sum(int num1x,int num2x, int num3x)
{
    int sum_ans;
    
    sum_ans= num1x+num2x+num3x;
    
    printf("\nThe sum is: %d\n",sum_ans);
    flushall();
    
    return sum_ans;
}//end big_or_small()

void average(int total_x)
{
    int avg;
    
    avg=total_x/3;
    
    printf("The average is: %d",avg);
    
}//end average()
