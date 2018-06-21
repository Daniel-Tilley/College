/* Exercise 1 (8 marks)

Given a file, in which the first line contains the number of lines, 
and every subsequent line is of the form:

Firstname Surname Address

where names are non-spaced strings of up to 16 characters and 
Address is a string not exceeding 48 characters.
create a program to sort the records by surname and then first name.
Author: Daniel Tilley 
Date: 24/02/2015
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//function prototypes 
void upper_change(char *text); //changes strings to upper case letters 
int bsort(char (*records)[4][50], int num);
int compare(char* a, char* b);

main()
{
    
    char file1[41]; //file1 name
    char name[500][4][50];//array to store data 
    int file_lenght; //number of lines in file 
    int i=0; //counter in loops 
    int j=0; //counter in loops 
    FILE *fi,*fo; //file pointers
    
    //display message asking user to enter file names  
    printf("Please enter the first file name\n");
    gets(file1);
    
    //open file 
    fi = fopen(file1,"r");
    fo = fopen("Sorted.txt","w+");
    
    if (file1==NULL || "2.txt"==NULL)
    {
        //error message if file does not open properly 
        printf("\nError opening file, please try again.");
    }
    
    else
    {
        //success message if file opened sucessfully
        printf("\nFile opened sucessfully.\n");
        
        //scan the number of lines in and tell the user how many lines there are
        fscanf(fi,"%d",&file_lenght);
        printf("\nThe number of lines in the file is : %d\n",file_lenght);
        
        while(i<file_lenght)
        {
            //read in first and second name 
            fscanf(fi,"%s%s",name[i][0],name[i][1]);
            //read in address 
            fgets(name[i][2],48,fi);
            //copy last name and first name to [i][3] to transform to uppercase
            strcpy(name[i][3],name[i][1]);
            strcat(name[i][3]," ");
            strcat(name[i][3],name[i][0]);
            //call function to make upper case 
            upper_change(name[i][3]);

            i++;
        }//end while 
        
        //call bubble sort function
        bsort(name,file_lenght);
        
        //success message telling user the file was checked sucessfully 
        printf("\nFile checked and sorted sucessfully.\n");
        
        //set i back to 0
        i=0;
        
        //put sorted array back into .txt file 
        while(i<file_lenght)
        {
            fprintf(fo,"\nName: %s %s Address:%s",name[i][0],name[i][1],name[i][2]);
            i++;
        }//end while 
        
        //print success message 
        printf("\nText transfered back to %s successfully\n",file1);
        
        //close files 
        fclose(fi);
        fclose(fo);
    }//end else
    
    //print message telling user the file has been closed 
    printf("\nFile closed successfully\n");
    
    //keeps file open
    getchar();
}//end main

void upper_change(char *text)
{
    for(int i=0; i<=strlen(text); i++)
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


int bsort(char (*records)[4][50], int num)
{
    
	int sorted=0;
	while(!sorted)
    {
		sorted=1;
		int i;
		for(i=0; i<num-1; i++)
        {
            //Assumes the key (Canonical form) is in the [3] field in each record, can also use strcmp
			if (compare(records[i][3],records[i+1][3])>0)
            {
				sorted=0;
				char temp[200];
				int k;
				for(k=0;k<200; k++)
                {
					temp[k]=records[i][0][k];
					records[i][0][k]=records[i+1][0][k];
					records[i+1][0][k]=temp[k];
				}//end for 
			}//end if 
		}//end for 
	}//end while 
}//end bsort 

int compare(char* a, char* b)
{
	int res=0;
	int i=0;
	while ((0==res)&&(a[i]||b[i]))
    {
		res=a[i]-b[i];
		i++;
	}//end while 
	return res;
}//end compare
                



