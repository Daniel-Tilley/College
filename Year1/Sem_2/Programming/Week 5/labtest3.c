/* Write a program to do the following:
1. In your main(), use a simple menu to ask the user to choose a currency (either
Euro or US Dollar) and enter 3 different amounts corresponding to their
choice into a floating-point array.
2. Write 2 functions called
- change_to_Euro()
- change_to_Dollar()
where both functions use 1 parameter (a floating-point array) and return a
floating-point number. These functions are used to convert currencies into their
equivalent amounts in either Euro or US Dollar.
change_to_Euro() // converts US Dollars into Euro
change_to_Dollar() // converts Euro into US Dollars
where:
€1 = $1.15
$1 = €0.87
Note: Both functions also return the average of the 3 converted currencies.
3. In your main(), pass the array containing the amounts you entered (from point
1) to either the function change_to_Euro() or change_to_Dollar(), whichever
applies.
4. In the change_to_Euro() and change_to_Dollar() functions, display each
original amount in the array that was passed as a parameter beside the
corresponding amount in the converted currency.
5. Return the average of the 3 converted currencies to the main(). Display this
average in the main().
6. Have your program repeat and end gracefully (i.e. the user selects an option in
the menu to end the program).

Author: Daniel Tilley 
Date: 17/02/2015
*/

#include <stdio.h>
#define SIZE 3 //size of array 

//prototypes

float change_to_euro(float amounts[SIZE]);
float change_to_dollar(float amounts[SIZE]);

main()
{
    
    //variables 
    int menu_option=0; //menu option 
    float amounts[SIZE]={0};//array to enter in values 
    float avg=0; //average of 3 entered amounts 
    int i; //counter used in loop to read in values 
    
    //displays welcme message to user
    printf("***Welcome to simple conversion software 1.0***\n");
    
    
    //loop to keep menu open 
    while (menu_option!=2)
    {
        //displays menu
        printf("\nPress 0 for euro to dollar conversion\n");
        printf("Press 1 for dollar to euro conversion\n");
        printf("Press 2 to end to program\n");
        printf("Please select an option:\n");
    
        //read menu option
        scanf("%d",&menu_option);
        
        //switch to choose diferent menu options 
        switch (menu_option)
        {
            //option 0 euro to dollar
            case 0:
            {
                //display message telling user to enter amounts
                printf("\nPlease enter to amounts you would like to convert: (will be rounded to two decimal places on conversion)\n");
                
                //loop to read values into the array
                for (i=0;i<SIZE;i++)
                {
                    scanf("%f",&amounts[i]);
                }//end for 
                
                //call function and set avg to returned value
                avg=change_to_dollar(amounts);
                
                //display the average of the 3 converted values
                printf("\nThe average of the %d converted amounts is %f\n",SIZE,avg);
                
                //break out of option 0
                break;
            }//end case 0
            
            //option 1 dollar to euro
            case 1:
            {
                //display message telling user to enter amounts
                printf("\nPlease enter to amounts you would like to convert: (will be rounded to two decimal places on conversion)\n");
                
                //loop to read values into the array
                for (i=0;i<SIZE;i++)
                {
                    scanf("%f",&amounts[i]);
                }//end for 
                
                //call function and set avg to returned value
                avg=change_to_euro(amounts);
                
                //display the average of the 3 converted values
                printf("\nThe average of the %d converted amounts is %f\n",SIZE,avg);
                
                //break out of option 1
                break;
            }//end case 1
            
            //exit case 
            case 2:
            {
                //display end message 
                printf("\nThank you for using simple conversion software");
                
                //break out of option 2
                break;
            }//end case 2
            
            //default case (error checking)
            default:
            {
                //prints error message and asks user to re-enter value into menu
                printf("\nError, that is not a valid option, please try again.\n");
                printf("Please enter an option:\n\n");
                scanf("%d",&menu_option);
                break;
            }//end case (default)
        }//end switch 
    }//end while
}//end main()

float change_to_dollar(float amounts[])
{
    float converted_amounts[SIZE]={0};//array to store the converted amounts 
    float average=0;//average of the converted amounts 
    int i;//counter used in loop
    
    //print new line 
    printf("\n");
    
    //loop to covert values 
    for (i=0;i<SIZE;i++)
    {
        converted_amounts[i]=(amounts[i]*1.15);
    }//end for 
    
    //loop to print converted values 
    for (i=0;i<SIZE;i++)
    {
        printf("% .2f euros in dollars is: % .2f\n",amounts[i],converted_amounts[i]);
    }//end for 
    
    //loop to calculate average of converted values
    for (i=0;i<SIZE;i++)
    {
        average=average+converted_amounts[i];
    }//end for 
    
    //calculate average
    average=average/SIZE;
    
    //return average
    return average;
}//end change_to_euro()

float change_to_euro(float amounts[])
{
    float converted_amounts[SIZE]={0};//array to store the converted amounts 
    float average=0;//average of the converted amounts 
    int i;//counter used in loop
    
    //print new line 
    printf("\n");
    
    //loop to covert values 
    for (i=0;i<SIZE;i++)
    {
        converted_amounts[i]=(amounts[i]*0.87);
    }//end for 
    
    //loop to print converted values 
    for (i=0;i<SIZE;i++)
    {
        printf("% .2f dollars in euros is: % .2f\n",amounts[i],converted_amounts[i]);
    }//end for 
    
    //loop to calculate average of converted values
    for (i=0;i<SIZE;i++)
    {
        average=average+converted_amounts[i];
    }//end for 
    
    //calculate average
    average=average/SIZE;
    
    //return average
    return average;
}//end change_to_dollar