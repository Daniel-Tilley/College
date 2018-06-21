/* A program to implement the tree diagram in c
Author: Daniel Tilley 
Date: 02/02/2015
*/

#include <stdio.h>
main()
{
    
    //declare variables 
    int i=0;
    int j=0;
    int tree_size;
    
    //ask user to enter tree size 
    printf("Please enter the size of the tree:\n");
    scanf("%d",&tree_size);
    flushall();
    
    //skip to new lines to print tree
    printf("\n\n");
    
    //for loop to print tree 
    for( i=1; i<= tree_size; i++)
    {
        //for loop to print spaces before the star 
        for (j=1; j<=tree_size-i; j++)
        {
            printf(" ");
        }//end inner for 
        
        //for loop to print the stars 
        for (j=1; j<=(i*2)-1; j++)
        {
            printf("*");
        }//end inner for 
        
        //prints the stars on a new line for a tree effect
        printf("\n");
    }//end for
    
    //prints spaces before the trunk
    for (i=0; i< (tree_size-1); i++)
    {
        printf(" ");
    }//end for 
    
    //prints trunk
    printf("*");
    
    //keeps program open
    getchar();
    
}//end main()
    