/* prompt the user for a name and lastname, generate the key, 
and print the contents of the record if it exists (from the .txt file) to the terminal
Author: Daniel Tilley 
Date: 03/03/2015
*/

#include <stdio.h>
#include <string.h>

//structure template 
struct records
{
    char name_first[25];
    char name_second[25];
    char address[50];
    char name_upper[52];
    int record_number;
} number[1001] ;


//function prototypes
void upper_change(char *); //changes strings to upper case letters 
int bsort(struct records number[1001], int); //sorts data by last name, then first name 

main()
{
    
    char file1[41]; //file1 name
    char file2[41]; //file 2 name
    char first_name[25]; //entered first name 
    char last_name[25]; //entered last name 
    char name[52]={'\0'}; //entered name 
    int file_lenght; //number of lines in file 
    int i=0; //counter in loops 
    int flag_found=0; //flag to tell if user has been found 
    int n=0; //record number 
    FILE *fi; //file pointers
    
    //display message asking user to enter file names  
    printf("Please enter the file name\n");
    gets(file1);
    
    //ask user for number of lines in file 
    printf("\nPlease enter the number of lines in the file:\n");
    printf("\n***Max is 1000 lines***\n");
    scanf("%d",&file_lenght);
    
    //open file 
    fi = fopen(file1,"r");
    
    //checks if file open successfully or not 
    if (file1==NULL)
    {
        //error message if file does not open properly 
        printf("\nError opening file \"%s\", please try again.",file1);
    }//end if 
    
    else
    {
        //success message if file opened sucessfully
        printf("\nFile \"%s\" opened sucessfully.\n",file1);
        
        //loop to read in values 
        for(i=0;i<file_lenght;i++)
        {
            //read in first and second name 
            fscanf(fi,"%s %s",number[i].name_first,number[i].name_second);
            
            //read in address 
            fgets(number[i].address,50,fi);
            flushall();
            
            number[i].record_number=i+1;
            
            //copy last name and first name to upper name and then change it to upper case 
            strcpy(number[i].name_upper,number[i].name_second);
            strcat(number[i].name_upper," ");
            strcat(number[i].name_upper,number[i].name_first);
            
            //call upper case function
            upper_change(number[i].name_upper);
        }//end while 
        
        //display success message 
        printf("\nData copied successfully\n");
        
        //call bubble sort function
        bsort(number,file_lenght);

        //success message telling user the file was checked sucessfully 
        printf("\nFile \"%s\" checked and sorted sucessfully.\n",file1);
        
        //close file 
        fclose(fi);
        
        //print sucess message
        printf("\nFile \"%s\" closed sucessfully\n",file1);
        
        //ask user to enter a first name
        printf("\nPlease enter a first name\n");
        gets(first_name);
        
        //ask user to enter a last name 
        printf("\nPlease enter a last name:\n");
        gets(last_name);
        
        //combine names to search
        strcat(name,last_name);
        strcat(name," ");
        strcat(name,first_name);
        
        //make name upper case 
        upper_change(name);
        
        //searching 
        for(i=0;i<file_lenght+2;i++)
        {
            //if values match and user is found 
            if(strcmp(name,number[i].name_upper)==0)
            {
                //display success message 
                printf("\nUser found\n");
                //set n=position in loop
                n=i;
                //set flag=1
                flag_found=1;
                //break out of loop 
                break;
            }//end if 
            
            else
            {
                flag_found=0;
            }//end else 
        }//end for 
        
        if(flag_found==1)
        {
            //display user info
            printf("\nName: %s %s Address:%s\n",number[n].name_first,number[n].name_second,number[n].address);
        }//end if 
        
        if(flag_found==0)
        {
            //print error 
            printf("\nError, user not found");
        }//end if 
    }//end else 
    
    getchar();
}//end main



void upper_change(char *text)
{
    int i;
    
    for( i=0; i<=strlen(text); i++)
    {
        //checks if the character is lower case 
        if( (text[i] > 96 ) && (text[i] < 123) )
        {
            //makes the text upper case 
            text[i] = text[i] - 'a' + 'A'; 
        }//end if 
        else
        {
            //text remains the same if already upper case
            text[i] = text[i];
        }//end else 
    }//end for 
}//end upper_change


int bsort(struct records number[1001], int num)
{
    int sorted=0; //sorting flag 
    int i=0; //counter 
    char temp[1001]; //temp value to store the swapped strings 
    
    while(!sorted)
    {
        sorted=1;
    
        for(i=0;i<num;i++)
        {
            //if i is greater than i+1
            if (strcmp(number[i].name_upper,number[i+1].name_upper)>0)
            {
                sorted=0;
                
                //swap the upper case names around 
                strcpy(temp,number[i].name_upper);
                strcpy(number[i].name_upper,number[i+1].name_upper);
                strcpy(number[i+1].name_upper,temp);
                
                //swap the first names around
                strcpy(temp,number[i].name_first);
                strcpy(number[i].name_first,number[i+1].name_first);
                strcpy(number[i+1].name_first,temp);
                
                //swap the second names around 
                strcpy(temp,number[i].name_second);
                strcpy(number[i].name_second,number[i+1].name_second);
                strcpy(number[i+1].name_second,temp);
                
                //swap the address around 
                strcpy(temp,number[i].address);
                strcpy(number[i].address,number[i+1].address);
                strcpy(number[i+1].address,temp);
            }//end if
        }//end for
    }//end while
}//end bsort 