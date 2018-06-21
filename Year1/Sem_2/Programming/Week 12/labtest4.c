/*
A) Using appropriate data types, design a structure template to hold the following driver’s
licence information. Note: You must use a nested structure for the Date of Birth.
First name
Surname
Date of Birth
Height
Eye colour
Weight

B) Using the driver’s licence structure template you designed, create two variables in your
main() function to represent TWO separate people. Write a function that is used to
allow driver licence details be entered from standard input. Show how you use this
function to enter the driver licence details for the two people you create in your
main() function.

C) Write a separate function to display the details of the two drivers entered in part (b).

Author: Daniel Tilley 
Date: 21/04/2015
*/

#include <stdio.h>
#define SIZE 2

struct date
{
    int day;
    int month;
    int year;
};

struct drivers
{
    char first[16];
    char last[16];
    struct date birth[SIZE];
    float height;
    char eye_colour[8];
    float weight;
};


void enter_details(struct drivers *,struct drivers *); //function to enter data 
void display_details(struct drivers *, struct drivers *); //function to display data
    
main()
{
    struct drivers person_a; //person 1
    struct drivers *person_a_ptr; //pointer 
    person_a_ptr = &person_a;
    
    struct drivers person_b; //person 2
    struct drivers *person_b_ptr; //pointer 
    person_b_ptr = &person_b;

        
    enter_details(person_a_ptr,person_b_ptr);
    display_details(person_a_ptr,person_b_ptr);
    
    getchar();
    
    
}//end main


//function to enter details
void enter_details(struct drivers *person_a_ptr, struct drivers *person_b_ptr)
{
    //user 0 
    //first name
    printf("Please enter the first name of user 0: ");
    scanf("%s",&(person_a_ptr->first));
    //surname 
    printf("\nPlease enter the last name of user 0: ");
    scanf("%s",&(person_a_ptr->last));
    
    /*
    //D.O.B
    //Day
    printf("\n\nPlease enter the day of the D.O.B of %s %s: ",person_a_ptr->first,person_a_ptr->last);
    scanf("%d",&(person_a_ptr->));
    //Month 
    printf("\n\nPlease enter the month of the D.O.B of %s %s: "person_a_ptr->first,person_a_ptr->last);
    scanf("%s",&(person_a_ptr->last));
    //Year
    printf("\n\nPlease enter year of the D.O.B of %s %s: "person_a_ptr->first,person_a_ptr->last);
    scanf("%s",&(person_a_ptr->last));
    */
    //Height
    printf("\nPlease enter the height in meters (e.g 1.80) of %s %s: ",person_a_ptr->first,person_a_ptr->last);
    scanf("%f",&(person_a_ptr->height));
    //Eye colour
    printf("\nPlease enter the eye colour of %s %s: ",person_a_ptr->first,person_a_ptr->last);
    scanf("%s",&(person_a_ptr->eye_colour));    
    //Weight
    printf("\nPlease enter the weight in kg (e.g 68.6) of %s %s: ",person_a_ptr->first,person_a_ptr->last);
    scanf("%f",&(person_a_ptr->weight));
    flushall();
    
    //user 1
    //first name
    printf("\n\nPlease enter the first name of user 1: ");
    scanf("%s",&(person_b_ptr->first));
    //surname 
    printf("\nPlease enter the last name of user 1: ");
    scanf("%s",&(person_b_ptr->last));
    
    /*
    //D.O.B
    //Day
    printf("\n\nPlease enter the day of the D.O.B of %s %s: "person_b_ptr->first,person_b_ptr->last);
    scanf("%d",&(pers));
    //Month 
    printf("\n\nPlease enter the month of the D.O.B of %s %s: "person_b_ptr->first,person_b_ptr->last);
    scanf("%d",&(person_a_ptr->last));
    //Year
    printf("\n\nPlease enter year of the D.O.B of %s %s: "person_b_ptr->first,person_b_ptr->last);
    scanf("%d",&(person_a_ptr->last));
    */
    //Height
    printf("\nPlease enter the height in meters (e.g 1.80) of %s %s: ",person_b_ptr->first,person_b_ptr->last);
    scanf("%f",&(person_b_ptr->height));
    //Eye colour
    printf("\n\nPlease enter the eye colour of %s %s: ",person_b_ptr->first,person_b_ptr->last);
    scanf("%s",&(person_b_ptr->eye_colour));    
    //Weight
    printf("\nPlease enter the weight in kg (e.g 68.6) of %s %s: ",person_b_ptr->first,person_b_ptr->last);
    scanf("%f",&(person_b_ptr->weight));
    flushall();

}//end enter_details


//function to display details
void display_details(struct drivers *person_a_ptr, struct drivers *person_b_ptr)
{
    //user 0 data
    printf("\n\nUser 0 data:\n\n");
    printf("Name: %s %s\n",person_a_ptr->first,person_a_ptr->last);
    printf("D.O.B: %d/%d/%d\n",1,1,1);
    printf("Height: %.1f\n",person_a_ptr->height);
    printf("Eye Colour: %s\n",person_a_ptr->eye_colour);
    printf("Weight: %.1f\n",person_a_ptr->weight);
    
    //user 1 data 
    printf("\n\nUser 0 data:\n\n");
    printf("Name: %s %s\n",person_b_ptr->first,person_b_ptr->last);
    printf("D.O.B: %d/%d/%d\n",1,1,1);
    printf("Height: %.1f\n",person_a_ptr->height);
    printf("Eye Colour: %s\n",person_a_ptr->eye_colour);
    printf("Weight: %.1f\n",person_a_ptr->weight);
    
    
}//end display_details