//Write a C progarm that calculates the frequncy of integers in an array of 100 ints 

#include<stdio.h>
#include<stdlib.h>


main()
{
    int array[101] = {0};
    int i = 0;
    int j = 0;
    int flag = 0; 
    
    for(i = 0; i < 101; i++)
    {
        *(array + i) = rand() % 101;
    }//end for 
    
    for(i = 0; i < 101; i ++)
    {
        for(j = 0; j < 101; j++)
        {
            if(*(array + j) == i)
            {
               flag ++; 
            }//end if 
        }//end for 
        
        printf("The number of times %d appears is: %d \n", i, flag);
        flag = 0;
    }//end for 
    
    getchar();
    flushall();
}//end main 