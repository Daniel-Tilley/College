/* This is a program that demonstrates the towers of hanoi game.
Author: Daniel Tilley 
Date: 09/02/2015
*/

#include <stdio.h>

//funtion prototype
void tower(int,int,int,int);

main()
{
    
    //number of disks
    int disks;
    
    //ask the user to enter the number of disks
    printf("Enter the number of disks : ");
    scanf("%d", &disks);
    flushall();
    
    //displays the moves bak to the user 
    printf("\nThe moves are as follows:\n");
    //calls the function to display the moves 
    tower(disks, 1, 2, 3);
    //keeps program open
    getchar();
}//end main

//function tower recieves the number of disks and towers 1,2 and 3.
void tower(int disks, int source, int dest, int spare)
{
    //base case
    if (disks==1)
    {
        printf("\nMove disk 1 from tower %d to tower %d", source, dest);
        return;
    }
    
    //tries to move other disks 
    tower(disks-1, source, spare, dest);
    printf("\nMove disk %d from tower %d to tower %d", disks, source, dest);
    tower(disks-1, spare, dest, source);
}//end tower
    