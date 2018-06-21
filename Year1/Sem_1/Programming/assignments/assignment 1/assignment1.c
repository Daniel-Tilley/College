/* This is a program that will opperate on an atm machine for a bank and will allow bank 
cutomers to manage their 4 digit pin number. The pin has been initialised to 1234 as default
This program uses a menu system that:
1)Allows users to enter pin and checks it is correct
2)Alows users to change their pin
3)Displays the number of time the user has successfully and incorrectly entered their pin
4)Exits the program
Author: Daniel Tilley
Date: 05/11/14
*/

#include <stdio.h>
//define size of arrays
#define SIZE 4
//define menu options 
#define MO1 1
#define MO2 2
#define MO3 3
#define MO4 4
main()
{
    
    //declare and initialise variables used in the program
    unsigned int pin[SIZE]={1,2,3,4}; //pin number
    unsigned int pin_temp[SIZE]={0}; // temp pin used when checking pins in options 1 and 2
    unsigned int pin_check[SIZE]={0}; //temp pin used when verifying pin in option 2
    unsigned int menu_option=0; //option that user selects in menu
    int i=0; //index used as counter in for loop
    int count_right=0; //used to count how many times pin entered correctly 
    int count_wrong=0; //used to count how many time pin entered incorrectly 
    int condition_true=0; //used in error checking 
    
    //display welcome message and inform user that pin is 1234 by default and that zero cannot be entered (due to error checking)
    printf("Hello and welcome to D.I.T ATM, please select an option from the list below.\n");
    printf("By default, PIN is 1234.\n");
    printf("\n(*NOTE* Zero will not be accepted as a valid PIN number.)\n");
    printf("(*NOTE* If a decimal number is entered, only first number will be accepted.)\n");
    
    //create loop to allow the program to continue running until option 4 is selected 
    do
    {
        //display menu
        printf("\n--------------------------------------MENU--------------------------------------\n");
        printf("Press 1 to enter your PIN and verify it is correct.\n");
        printf("Press 2 to enter a new PIN.\n");
        printf("Press 3 to show how many times the PIN was entered successfully and incorrectly.");
        printf("Press 4 to exit program.\n");
        printf("\n--------------------------------------------------------------------------------\n");
        printf("Please enter your option:\n");
    
        //user selects menu option
        scanf("%d",&menu_option);
        flushall();
        
        //error checking so user only enters a value between 1 and 4 into the menu
        while (menu_option<MO1 || menu_option>MO4)
        {
            printf("\nError, you have entered an invalid option, please try again.\n");
            printf("Please enter your option:\n");
            scanf("%d",&menu_option);
            flushall();
        }
        
        //switch to select which option is displayed
        switch (menu_option)
        {
            //option 1 (pin checking)
            case MO1:
            {
                //tell user to enter pin
                printf("\nPlease enter your PIN:\n(*NOTE* Please press enter after each digit.)\n");
                
                //loop to scan value into pin 
                for (i=0 ; i<SIZE ; i++)
                {
                    scanf("%d",&pin_temp[i]);
                    flushall();
                    //error checking to make sure a 4 digit pin is entered 
                    if (pin_temp[i]>9||pin_temp[i]<1)
                    {
                        //display error message
                        printf("\nError, please re-enter valid PIN number and press enter after each digit:\n");
                        
                        //reset pin back to 0000 to stop user entering characters 
                        for (i=0 ; i<SIZE ; i++)
                        {
                            pin_temp[i]=0;
                        }//end inner for 
                        
                        //count as wrong input 
                        count_wrong++;
                        //reset value of i so user can re-input pin
                        i=-1;
                    }//end if
                }//end for loop
       
                //loop to determine whether pin is correct or not
                for (i=0 ; i<SIZE ; i++)
                {
                    if (pin_temp[i]==pin[i])
                    {
                        condition_true++;
                    }//end if 
                }//end for 
                
                //if loop is true 
                if (condition_true==4)
                {
                    //success mesage displayed 
                    printf("\n*You have entered: ");
                    //count as right input
                    count_right++;
                    for (i=0 ; i<SIZE ; i++)
                    {
                        printf("%d",pin_temp[i]);
                    }//end for
                    printf("*\n*This is the correct PIN*");
                }//end if
                
                else
                {
                    //if pin is incorrect, failure message displayed 
                    printf("\n*You have entered: ");
                    //count as a wrong input
                    count_wrong++;
                    for (i=0 ; i<SIZE ; i++)
                    {
                        printf("%d",pin_temp[i]);
                    }//end for
                    printf("*\n*This is not the correct PIN*");
                }//end else 
                
                //set all variables used back to zero
                for (i=0 ; i<SIZE ; i++)
                {
                    pin_temp[i]=0;
                }//end for
                condition_true=0;
                menu_option=0;
                break;
            }//end case (1)
                    
            //option 2 (allow user to enter new pin)
            case MO2:
            {
                //tell user to enter new pin
                printf("\nPlease enter your new PIN:\n(*NOTE* Please press enter after each digit.)\n");
                
                //loop to scan pin into array
                for (i=0 ; i<SIZE ; i++)
                {
                    scanf("%d",&pin_temp[i]);
                    flushall();
                    
                    //error checking to make sure a 4 digit pin is entered 
                    if (pin_temp[i]>9||pin_temp[i]==0)
                    {
                        //display error message
                        printf("\nError, please re-enter valid PIN number and press enter after each digit:\n");
                        
                        //reset pin back to 0000 to stop user entering characters 
                        for (i=0 ; i<SIZE ; i++)
                        {
                            pin_temp[i]=0;
                        }//end inner for 

                        //count as wrong input 
                        count_wrong++;
                        //reset value of i so user can re-input pin
                        i=-1;
                    }//end if
                }//end for loop
                
                //when loop skipped, count as right input
                count_right++;
                
                //tells user to verify new pin number
                printf("\nPlease verify your new PIN:\n(*NOTE* Please press enter after each digit.)\n\n");
                
                //loop to scan pin into array
                for (i=0 ; i<SIZE ; i++)
                {
                    scanf("%d",&pin_check[i]);
                    flushall();
                    
                    //error checking to make sure a 4 digit pin is entered 
                    if (pin_check[i]>9||pin_check[i]<1)
                    {
                        //display error message 
                        printf("\nError, please enter a vaild PIN number to verify PIN number:\n");
                        
                        //reset pin back to 0000 to stop user entering characters 
                        for (i=0 ; i<SIZE ; i++)
                        {
                            pin_check[i]=0;
                        }//end inner for

                        //count as wrong input 
                        count_wrong++;
                        //reset value of i so user can re-input pin
                        i=-1;
                    }//end if
                }//end for loop
                
                //loop to determine whether or not pin will be changed or not
                for (i=0 ; i<SIZE ; i++)
                {
                    if (pin_temp[i]==pin_check[i])
                    {
                        condition_true++;
                    }
                }//end for 

                //if loop is true
                if (condition_true==4)
                {
                    //loop to place entered value into pin array
                    for (i=0 ; i<SIZE ; i++)
                    {
                        pin[i]=pin_check[i];
                    }//end for 
                    
                    //if pin is correct, success mesage displayed 
                    printf("\n*You PIN has been changed to: ");
                    for (i=0 ; i<SIZE ; i++)
                    {
                        printf("%d",pin[i]);
                    }//end for
                    printf("*");
                    
                    //count as right input
                    count_right++;
                }//end if
                
                else
                {
                    //if pin is incorrect, failure message displayed 
                    printf("\n*Your PIN has not been changed, please try again*\n");
                    //count as wrong input
                    count_wrong++;
                }//end else 
                
                //set variables used back to zero
                for (i=0 ; i<SIZE ; i++)
                {
                    pin_check[i]=0;
                    pin_temp[i]=0;
                }//end for
                condition_true=0;
                menu_option=0;
                break;
            }//end case (2)
                    
            //option 3 (display how many times pin entered successfully and incorrect)
            case MO3:
            {
                //display message to user telling them how many times pin has been entered correctly in option 1 and option 2
                printf("\nNumber of times PIN entered correctly: %d\n",count_right);
                printf("Number of times PIN not entered correctly: %d\n",count_wrong);
                //set variables used back to 0
                menu_option=0;
                break;
            }//end case (3)
            
            //option 4 (exit program)
            case MO4:
            {
                //breaks out of switch and program terminates 
                break;
            }//end case (4)
                    
            //if anything other than 1,2,3 or 4 is entered error message is displayed and menu option is re entered 
            default:
            {
                //prints error message and asks user to re-enter value into menu
                printf("\nError, that is not a valid option, please try again.\n");
                printf("Please enter an option:\n\n");
                scanf("%d",&menu_option);
                break;
            }//end case (default)
        }//end switch
    }//end do while 
    //do while condition (program stays open until 4 has been selected)
    while (menu_option!=MO4);
}//end main