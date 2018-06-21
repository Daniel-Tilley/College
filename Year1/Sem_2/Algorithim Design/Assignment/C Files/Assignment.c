/*
Algorithim Assignment DT228 Year 1
Author: Daniel Tilley
Date: 06/04/2014
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define SIZE 30 //size of array

//structure template 
struct record 
{
    char first[16];
    char last[16];
    char college[4];
    char key[32];
};
struct record data[SIZE]; //declare structure array 


void upper_change(char *,char *,char *); //changes strings to upper case letters
void b_sort(struct record *); //bubble sort function 
void i_sort(struct record *, unsigned int); //insertion sort function
void l_search(struct record *); //linear search function for college
void b_search(struct record *); //binary search function for last name 

main()
{
    
    unsigned int i; //counter in loops
    unsigned int j; //counter in loops 
    unsigned int last_pos=0; //position in the data array 
    unsigned int file_number=0; //number of files per file 
    unsigned int menu_option=0; //menu option for choosing to search 
    char file1[41]; //name of file to open
    FILE * fi,* fo; //file pointers
    
    //ask user how many files they wish to open 
    printf("Please enter the number of files you wish to open:\n\n");
    scanf("%d",&file_number);
    flushall();

    for(i=0;i<file_number;i++)
    {
        //ask user for file name to read from
        printf("\nPlease enter the file name you wish to open to read from:\n\n");
        scanf("%s",&file1);
        flushall();
        
        //open file for binary reading, if opened successfully
        if((fi=fopen(file1,"r"))!=NULL)
        {
            //as long as reading records succeeds, store them in the array
            for(j=last_pos;j<SIZE;j++)
            {
                //read in names 
                fscanf(fi,"%s",data[j].first);
                fscanf(fi,"%s",data[j].last);
                
                //makes strings upper case 
                upper_change(data[j].first,data[j].last,data[j].key);
                
                //read in college 
                if(fscanf(fi,"%s",data[j].college)==EOF)
                {
                    break;
                }//end if
            }//end for 
            
            last_pos=j;
            
            //sort
            i_sort(data,last_pos);
            
            //close file
            fclose(fi);
        }//end if
        
        else
        {
            //print error 
            printf("\nFile cannot be opened, please try again\n");
            
            i--;
            
            //close file 
            fclose(fi);
        }//end else
    }//end for
    
    //sort data 
    b_sort(data);
    
    //open file to print items to 
    fo = fopen("Year 1.txt","w+");
    
    //print items to text 
    for(i=0;i<SIZE;i++)
    {
        fprintf(fo,"%d) %s %s\n",i+1,data[i].first,data[i].last);
    }
    
    //close file and inform user 
    fclose(fo);
    printf("\nSorted records has been printed to \"Year 1.txt\"\n");
    
    //menu to let the user search for a record as many times as they like 
    while(menu_option!=3)
    {
        //display menu.
        printf("\n--------------------------------------MENU--------------------------------------\n");
        printf("Press 1 to search for colleges.\n");
        printf("Press 2 to search for a last name.\n");
        printf("Press 3 to exit program.\n");
        printf("\n--------------------------------------------------------------------------------\n");
        printf("Please enter your option:\n");
        
        //reset menu option (error checking for characters).
        menu_option=0;
        
        //read in a menu option.
        scanf("%d",&menu_option);
        flushall();
        
        //switch used to choose option.
        switch(menu_option)
        {
            //search college
            case 1:
            {
                //call function to search.
                l_search(data);
                break;
            }//end case 1.
            
            //search name
            case 2:
            {
                //call function to search.
                b_search(data);
                break;
            }//end case 2.
            
            //exit program
            case 3:
            {
                //closes program
                printf("\nClosing program");
                break;
            }//end case 1.
            
            //search college
            default:
            {
                //display user with an error messge. 
                printf("\nInvalid menu option, please try again.\n");
                break;
            }//end default
        }//end switch
    }//end while 
}//end main


//changes strings to upper case 
void upper_change(char *first,char *last, char * key)
{
    unsigned int i=0; //counter used in loop 
    
    //copys first name and last name to key
    strcpy(key,last);
	strcat(key," ");
	strcat(key,first);
    
    //makes key upper case 
	while(key[i]!=0)
    {
		key[i]=toupper(key[i]);
		i++;
	}//end while 
}//end upper_change 


//bubble sort function 
void b_sort(struct record *data)
{
    unsigned int i; //counter used in loop 
    unsigned int sort=0; //sorting flag
    char temp[68]; //temp string to store data 
    
    //loops while the list still has to be sorted 
    while(sort!=1)
    {
        //sets flag to false 
        sort=1;
        
        //loops around for the number of terms that have been read in
        for(i=0; i<SIZE-1; i++)
        {
            //compares strings and checks if sorted or not 
            if (strcmp(data[i].key,data[i+1].key)>0)
            {
                //sets flag to true
                sort=0;
                
                //copys strings 
                memcpy(temp,&data[i],68);
                memcpy(&data[i],&data[i+1],68);
                memcpy(&data[i+1],temp,68);
            }//end if 
        }//end for 
    }//end while 
}//end b_sort


void i_sort(struct record *data, unsigned int pos)
{
    unsigned int i; //counter in loop
    unsigned int j; //counter in loop
    char temp1[16]; //temp value for swap
    char temp2[16]; //temp value for swap
    char temp3[4]; //temp value for swap
    char current[32]; //value used for sorting
    
    for(i=pos-10;i<pos;i++)
    {
        //gets next element ready to compare 
        strcpy(current,data[i].key);
        strcpy(temp1,data[i].first);
        strcpy(temp2,data[i].last);
        strcpy(temp3,data[i].college);
        j = i;
        
        //finds the correct position
        while ((strcmp(data[j-1].key,current)>0) && j > 0)
        {
            strcpy(data[j].key,data[j-1].key);
            strcpy(data[j].first,data[j-1].first);
            strcpy(data[j].last,data[j-1].last);
            strcpy(data[j].college,data[j-1].college);
            j--;
        }//end while 
        
        //puts temp back in right position
        strcpy(data[j].key,current);
        strcpy(data[j].first,temp1);
        strcpy(data[j].last,temp2);
        strcpy(data[j].college,temp3);
    }//end for
}//end i_sort


//linear search 
void l_search(struct record *data)
{
    unsigned int i; //counter in loop
    char search[4]; //search term
    
    //ask user to enter a college to search for
    printf("\nPlease enter a college to search for:\n\n");
    scanf("%s",&search);
    flushall();
    
    //match entered term with that stored in memory
    i=0;
    while(search[i]!=0)
    {
		search[i]=toupper(search[i]);
		i++;
	}//end while 
    
    //search for records 
    for(i=0; i<SIZE; i++)
    {
        if(strcmp(data[i].college,search)==0)
        {
            printf("\nName: %s %s\n",data[i].first,data[i].last);
        }//end if
    }//end for
}//end l_search 


//binary search 
void b_search(struct record *data)
{
    unsigned int i; //counter used in loop
    int first; //first record 
    int middle; //middle record
    int last; //last record
    char search[16]; //search term
 
    first = 0;
    last = SIZE-1;
    middle = (first+last)/2;
    
    //user enters last name to search
    printf("\nPlease enter a last name to search for:\n\n");
    scanf("%s",&search);
    
    //matches entered term with that stored in records 
    i=1;
    search[0]=toupper(search[0]);
    while(search[i]!=0)
    {
		search[i]=tolower(search[i]);
		i++;
	}//end while 
    
    //while the first term is lower than the last
    while(first <= last) 
    {
        //checks if search term is higher than the middle term
        if(strcmp(data[middle].last,search)<0)
        {
            first = middle + 1;
        }//end if      
        
        //checks if the search term is the middle value
        else if(strcmp(data[middle].last,search)==0) 
        {
            printf("\nRecord found:\n\nName: %s %s\nCollege: %s\n\n",data[middle].first,data[middle].last,data[middle].college);
            break;
        }//end else if
        
        //if the search term is lower than the middle value 
        else
        {
            last = middle - 1;
        }//end else 
 
        middle = (first + last)/2;
    }//end whiile
    
    //if the value cannot be found 
    if (first > last)
    {
        printf("\nNo such record exists\n");
    }//end if 
}//end b_search 

