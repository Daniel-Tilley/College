/* This is a security program which is driven via menu system. The menu options are:
1) Enter an access code.
2) Encrypt and verify the code is correct. 
3) Decrypt the code .
4) Display the number of correct and incorrect times an access code has been entered. 
5) Exit the program gracefully.

By default the access code is stored in an array called access_code and 
is set to 4523. The access codes are 4 single-digit integer numbers between 0-9.

Encrytion algorithim:

- Swap the 1st number with the 3rd number.
- Swap the 2nd number with the 4th number.
- Add 1 to each number.
- If any number has a value equal to 10, change this value to 0.

Decryption algorithim: 

- Subtract 1 from each number.
- If any number has a value equal to -1, change this value to 9.
- Swap the 1st number with the 3rd number.
- Swap the 2nd number with the 4th number.

Features to note:

- The user should only be allowed to encrypt their code if the code is not already encrypted.
- The user should only be allowed to decrypt their code if the code is already encrypted.
- Only encrypted codes should be compared with the access-code.

Author: Daniel Tilley 
Date: 26/02/2015
*/

#include <stdio.h>
#define SIZE 4 //size of arrays. 
#define TIME 250000000 //timer used when closing program

//function prototypes.
void enter_pin(unsigned int *, unsigned int *, unsigned int *); //allows user to enter an access code.
void encrypt(unsigned int *, unsigned int *, unsigned int *, unsigned int *, unsigned int *, unsigned int *); //encrypts entered code. 
void verify(unsigned int *, unsigned int *, unsigned int *, unsigned int *); //verifies entered code against default code.
void decrypt(unsigned int *, unsigned int *); //decrypts entered code. 
void counter_display(unsigned int *, unsigned int *); //displays the amount of times the user enters the right and wrong code.
void exit_program(void); //exits the program.

main()
{
    //declare variables.
    unsigned static int access_code[SIZE]={4,5,2,3}; //default access code. 
    unsigned int code_temp[SIZE]={10,10,10,10}; //code entered by user that is compared to default access code (set to 10 for error checking purposes).
    unsigned int menu_option=0; //menu option the user enters.
    unsigned int flag_entered=0; //flag to check if a code has been entered by the user or not. 
    unsigned int flag_encrypt=0; //flag to tell whether a code has been encrypted or not. 
    unsigned int count_right=0; //counter to count how many times the code has been entered right.
    unsigned int count_wrong=0; //counter to tell how many times the code has been entered wrong.
    
    //display welcome message.
    printf("Hello and welcome to Access Code Checker v1.0, please select an option from the list below.\n");
    
    //loop to keep displaying menu until exit option 5 is selected. 
    while (menu_option!=5)
    {
        //display menu.
        printf("\n--------------------------------------MENU--------------------------------------\n");
        printf("Press 1 to enter an access code.\n");
        printf("Press 2 to encrypt and check the access code.\n");
        printf("Press 3 to decrypt your code.\n");
        printf("Press 4 to show how many times you have entered a code: \n(i) successfully. \n(ii) incorrectly.\n");
        printf("Press 5 to exit program.\n");
        printf("\n--------------------------------------------------------------------------------\n");
        printf("Please enter your option:\n");
        
        //reset menu option (error checking for characters).
        menu_option=0;
        
        //read in a menu option.
        scanf("%1d",&menu_option);
        flushall();
        
        //switch used to choose option.
        switch(menu_option)
        {
            //enter code. 
            case 1:
            {
                //call function to enter code.
                enter_pin(code_temp, &flag_entered, &flag_encrypt);
                break;
            }//end case 1.
            
            //encrypt and verify code. 
            case 2:
            {
                //call function to encrypt code.  
                encrypt(code_temp, access_code, &flag_entered, &flag_encrypt, &count_right, &count_wrong);
                break;
            }//end case 2.
            
            //decrypt code. 
            case 3:
            {
                //call function to decrypt code.
                decrypt(code_temp, &flag_encrypt);
                break;
            }//end case 3.
            
            //print number of correct and incorrect codes entered.
            case 4:
            {
                //call display function.
                counter_display(&count_right, &count_wrong);
                break;
            }//end case 4. 
            
            //exit program.
            case 5:
            {
                //call exit program function.
                exit_program();
                break;
            }//end case 5. 
            
            //if anything other than accepted menu options are entered.
            default:
            {
                //display user with an error messge. 
                printf("\nInvalid menu option, please try again.\n");
                break;
            }//end case default.
        }//end switch (menu_option).
    }//end while (menu_option!=5).
}//end main().


//enter pin function.
void enter_pin(unsigned int *code_temp, unsigned int *flag_entered, unsigned int *flag_encrypt)
{
    //declare variables. 
    unsigned int i=0; //counter used in loop. 
    unsigned int j=0; //counter used in loop. 
    
    //set code temp back to 10,10,10,10 for error checking. 
    for(i=0;i<SIZE;i++)
    {
        *(code_temp+i)=10;
    }//end for
    
    //print notice.
    printf("\n***** ONLY THE FIRST 4 ENTERED DIGITS (0-9) ARE TAKEN *****\n");
    //display message to user telling them to enter the code. 
    printf("Please enter your code:\n\n");
    
    //loop to enter the code. 
    for(i=0;i<SIZE;i++)
    {
        //read in code. 
        scanf("%1d",code_temp+i);
        
        //error checking.
        if(*(code_temp+i)>9||*(code_temp+i)<0)
        {
            //print error message.
            printf("\nInvalid input, please try again.\n");
        
            //set the contents of the code back to origional values. 
            for(j=0;j<SIZE;j++)
            {
                *(code_temp+j)=10;
            }//end for.
            
            //set flag entered back to 0 so code cannot be encrypted. 
            *flag_entered=0;
            
            //break out of the function so that the user can try input a code again.
            flushall();
            return;
        }//end if.
    }//end for.
    flushall();
        
    //display the pin the user has entered.
    printf("\nYou have entered: ");
    for(i=0;i<SIZE;i++)
    {
        printf("%d",*(code_temp+i));
    }//end for.
    printf("\n");
    
    //set entered flag to 1 so that the user can now encrypt and decrypt a code.
    *flag_entered=1;
    //set flag encrypt to 0 to indicate the code has still to be encrypted.
    *flag_encrypt=0;
}//end enter_pin().


//function to encrypt pin.
void encrypt(unsigned int *code_temp, unsigned int *access_code, unsigned int *flag_entered, 
             unsigned int *flag_encrypt, unsigned int *count_right, unsigned int *count_wrong)
{
    //declare variables 
    unsigned int temp; //temp variable used when swapping values in the code. 
    unsigned int i=0; //counter used in loop.
    
    //if the user has not entered a code.
    if(*flag_entered==0)
    {
        //tells user to enter a code and returns to the main().
        printf("\nPlease enter a code to encrypt first.\n");
        return;
    }//end if.
    
    //if the user has entered a code.
    if(*flag_entered==1)
    {
        //if code is alreadyy encrypted.
        if(*flag_encrypt==1)
        {
            //display error message and return to main. 
            printf("\nCode is already encrypted, please decrypt code first or enter a new code.\n");
            return;
        }//end if(flag_encrypt==1)
        
        //if code is not already encrypted.
        if(*flag_encrypt==0)
        {
            //encrypt code.
            // swap first and third digit.
            temp=*code_temp;
            *code_temp=*(code_temp+2);
            *(code_temp+2)=temp;
            
            //swap second and fourth digit.
            temp=*(code_temp+1);
            *(code_temp+1)=*(code_temp+3);
            *(code_temp+3)=temp;
            
            //add 1 to each number and check if any number is 10. 
            for (i=0;i<SIZE;i++)
            {
                (*(code_temp+i))++;
                if((*(code_temp+i))==10)
                {
                    *(code_temp+i)=0;
                }//end if 
            }//end for 
            
            //tell user the code has been encrypted 
            printf("\nYour code has been encrypted, now verifying your code.\n");
            
            //timer 
            for(i=0;i<(TIME*4);i++)
            {
            }//end for
            
            //set flag_encrypt to 1 to indicate the code has been encrypted.
            *flag_encrypt=1;
            
            //call verify functon.
            verify(access_code, code_temp, count_right, count_wrong);
        }//end if(flag_encrypt==0)
    }//end if(flag_entered==1)
}//end encrypt().


//function to verify encrypted pin 
void verify(unsigned int *access_code, unsigned int *code_temp, unsigned int *count_right, unsigned int *count_wrong)
{
    //declare variables.
    unsigned int i; //counter used in loop. 
    unsigned int correct=0; //variable used in checking the two codes.
    
    //for loop to check entered code against stored code.
    for(i=0;i<SIZE;i++)
    {
        //if one digit equals the other, increment the correct counter.
        if(*(access_code+i)==*(code_temp+i))
        {
            //increment the correct digit counter.
            correct++;
        }//end if.
    }//end for.
    
    //if the correct counter is 4, display a success message.
    if(correct==4)
    {
        printf("\nCORRECT CODE\n");
        //increment the correct code counter.
        (*(count_right))++;
    }//end if.
    
    //otherwise print an error message.
    else
    {
        printf("\nERROR CODE\n");
        //increment the wrong code counter.
        (*(count_wrong))++;
    }//end else.
}//end verify().


//function to decrypt pin 
void decrypt(unsigned int *code_temp, unsigned int *flag_encrypt)
{
    //declare variables 
    unsigned int temp; //temp variable used when swapping values in the code. 
    unsigned int i=0; //counter used in loop.
    
    //if a code has not been encrypted.
    if(*flag_encrypt==0)
    {
        //print error message and return to main().
        printf("\nPlease encrypt a code first.\n");
        return;
    }//end if 
    
    else 
    {
        //decrypt code
        //take 1 to from number and check if any number is -1. 
        for (i=0;i<SIZE;i++)
        {
            (*(code_temp+i))--;
            if((*(code_temp+i))==-1)
            {
                *(code_temp+i)=9;
            }//end if 
        }//end for 
        
        // swap first and third digit.
        temp=*code_temp;
        *code_temp=*(code_temp+2);
        *(code_temp+2)=temp;
            
        //swap second and fourth digit.
        temp=*(code_temp+1);
        *(code_temp+1)=*(code_temp+3);
        *(code_temp+3)=temp;
    }//end else 
    
    //tell user decrypted pin
    printf("\nYour decrypted code is: ");
    for(i=0;i<SIZE;i++)
    {
        printf("%d",*(code_temp+i));
    }//end for.
    printf("\n");
    
    //set flag encrypt to 0 to indicate that the code can be encrypted again.
    *flag_encrypt=0;
}//end decrypt().


//function to display correct and incorrect amount of codes entered.
void counter_display(unsigned int *count_right, unsigned int *count_wrong)
{
    printf("\nThe number of times you have entered a code:\n");
    
    //display number of right times 
    printf("\n(i)  Correctly:    %d",*count_right);
    
    //display number of wrong times 
    printf("\n(ii) In-Correctly: %d\n",*count_wrong);
}//end counter_display().


//function to exit program
void exit_program(void)
{
    //counter for loop.
    unsigned int i=0;
    
    //display message to user telling them the program is closing.
    printf("\nClosing program"); 
    
    //timer to show message and close program.
    for(i=0;i<TIME;i++)
    {
    }//end for
}//end exit program().