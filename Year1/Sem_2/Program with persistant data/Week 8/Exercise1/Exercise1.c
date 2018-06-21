/* Given a file containing records of the form 

struct record
{
    char first[16];
    char last[16];
    char addr[48];
    char key[32];
};

stored sorted by key in a binary file, create a program which allows a user to search for a record by entering the names, 
and displays the address. The user should be asked if they want to change the address, and if selected, the address stored on disk should be changed.

Part 2:
Update the program to allow insertions into the file (from information entered at the terminal by the user), while keeping the file sorted

Part 3:
update the program to also allow deletions

Author: Daniel Tilley 
Date: 10/03/2015 
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//structure template 
struct record 
{
    char first[16];
    char last[16];
    char addr[48];
    char key[32];
};
struct record *data; //declare structure array 

//function prototype 
void toupper(char *); //changes strings to upper case letters 
int bsort(struct record *, int, int); //sorts data by last name, then first name 

main()
{
    int i=0; //counter in loop 
    int rec_num=0; //record number
    int size=100; //size of array element 
    int menu_option=1; //menu option when selecting what to do
    int option=0; //ask user to change address or not 
    int pos=0; //position in array 
    int last_pos=0; //last position in array 
    char file1[41]; //name of file to open 
    char name_first[16]; //first name to be entered 
    char name_last[16]; //last name to be entered
    char name_upper[32]; //upper case name to search 
    data=(struct record *)malloc(size*sizeof(struct record)); //allocate size of array 
    FILE * fi,* fo; //file pointers 
    
    //ask user for file name to read from
    printf("Please enter the file name you wish to open to read from:\n\n");
    gets(file1);
    
    fo=fopen("TextFileOrg.txt","w+");
    
    //open file for binary reading, if opened successfully
    if((fi=fopen(file1,"rb"))!=NULL)
    {
        //as long as reading records succeeds, store them in the array
        for(i=0;(fread(&data[i],sizeof(struct record),1,fi)>0);i++)
        {
            //if the array is not big enough, resize it.
            if(i>size-2)
            {
                size=size+100;
                data=(struct record *)realloc(data,size*sizeof(struct record));
            }//end if
            
            //increment rexord number 
            rec_num++;
            //print binary file to txt file.
            fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Canonical Form: %s\n Record Number: %d\n\n",data[i].first,data[i].last,data[i].addr,data[i].key,rec_num);
            
            last_pos=i;
        }//end while 
        
        //tell user .txt file has been created and close text file.
        printf("\nContents of binary file have been printed to \"TextFileOrg.txt\"\n");
        fclose(fo);
        
        //increment last pos 
        last_pos++;
        
        //tell user the number of records 
        printf("\nNumber of records is %d\n",last_pos);
        do
        {
            //ask user if they wish to search for a user in the database 
            printf("\n--------------------------------------MENU--------------------------------------\n");
            puts("Press 0 to exit");
            puts("Press 1 to search for a record and change address");
            puts("Press 2 to enter a new record");
            puts("Press 3 to delete a record");
            printf("\n--------------------------------------------------------------------------------\n\n");
            
            //enter in an option
            scanf("%d",&menu_option);
            flushall();
            
            switch(menu_option)
            {
                case 0:
                {
                    break;
                }//end case 0
                
                case 1:
                {
                    //get first name
                    printf("\nPlease enter a first name:\n");
                    gets(name_first);
                    flushall();
            
                    //get last name
                    printf("\n\nPlease enter a second name:\n");
                    gets(name_last);
                    flushall();
                
                    //copy last name and first name to upper name and then change it to upper case 
                    strcpy(name_upper,name_last);
                    strcat(name_upper,".");
                    strcat(name_upper,name_first);
                    
                    //call upper case function
                    toupper(name_upper);
                    
                    //search for name 
                    printf("\nNow searching....\n");
            
                    for(i=0;i<size;i++)
                    {
                        if((strcmp(name_upper,data[i].key))==0)
                        {
                            printf("\n***** Record found *****\n");
                            pos=i;
                            break;
                        }//end if 
                    }//end for 
            
                    if(pos==0)
                    {
                        printf("\n***** Record not found *****\n"); 
                    }//end if
            
                    else
                    {
                        printf("\nName: %s %s\nAddress:%s\n",data[pos].first,data[pos].last,data[pos].addr);
                        
                        printf("\nWould you like to change the address? (1 for yes, 0 for no)\n");
                        scanf("%d",&option);
                        flushall();
                        
                        //if the user wants to leave the address alone 
                        if(option==0)
                        {
                            break;
                        }//end if 
                        
                        else 
                        {
                            //ask user to enter new address 
                            printf("\nPlease enter the new address:\n");
                            gets(data[pos].addr);
                            strcat(data[pos].addr,"\n");
                            flushall();
                            
                            //open file for writing
                            fo=fopen(file1,"wb+");
                            for(i=0;i<size;i++)
                            {
                                //write new data to file 
                                fwrite(&data[i], sizeof(struct record) , 1, fo);
                            }//end for
                            fclose(fo);
                            
                            pos=1;
                            
                            //print new contents to changed address file 
                            fo=fopen("Text_File_Address_Change.txt","w+");
                            for(i=0;i<size;i++)
                            {
                                //print new data to text file 
                                fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Canonical Form: %s\n Record Number: %d\n\n"
                                ,data[i].first,data[i].last,data[i].addr,data[i].key,pos);    
                                pos++;
                            }//end for
                            fclose(fo);
                            
                            //tell user new file has been printed 
                            printf("\nNew records sent to \"Text_File_Address_Change.txt\"\n");
                        }//end inner else 
                    }//end else 
                    break;
                }//end case 1
                
                case 2:
                {
                    //for loop to read in new data
                    for(i=last_pos;i<last_pos+1;i++)
                    {
                        //check if array is big enough 
                        if(i>size-2)
                        {
                            size=size+100;
                            data=(struct record *)realloc(data,size*sizeof(struct record));
                        }//end if
                        
                        printf("\nPlease enter a first name:\n");
                        gets(data[i].first);
                        flushall();
                        
                        printf("\nPlease enter a last name:\n");
                        gets(data[i].last);
                        flushall();
                        
                        printf("\nPlease enter an address:\n");
                        gets(data[i].addr);
                        strcat(data[i].addr,"\n");
                        flushall();
                        
                        strcpy(data[i].key,data[i].last);
                        strcat(data[i].key,".");
                        strcat(data[i].key,data[i].first);
                        
                        //call upper case function
                        toupper(data[i].key);
                        
                        //bsort(data,last_pos,i);
                    }//end for
                    
                    //open file for writing
                    fo=fopen(file1,"wb+");
                    for(i=0;i<last_pos+1;i++)
                    {
                        //write new data to file 
                        fwrite(&data[i], sizeof(struct record) , 1, fo);
                    }//end for
                    fclose(fo);
                    
                    pos=1;
                    
                    //print new contents to changed address file 
                    fo=fopen("Text_File_New_Record.txt","w+");
                    for(i=0;i<last_pos+1;i++)
                    {
                        //print new data to text file 
                        fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Canonical Form: %s\n Record Number: %d\n\n"
                        ,data[i].first,data[i].last,data[i].addr,data[i].key,pos); 
                    pos++;
                    }//end for
                    fclose(fo);
                    
                    //tell user new file has been printed 
                    printf("\nNew records sent to \"Text_File_New_Record.txt\"\n");
                    break;
                }//end case 2
                
                case 3:
                {
                    break;
                }//end case 3
                
                default:
                {
                    printf("\nInvalid option, please try again\n");
                    break;
                }//end case default
            }//end else 
        }//end do while.
        while(menu_option!=0);
    }//end if
    
    else
    {
        //print error 
        printf("\nFile cannot be opened\n");
        
        //keep program open
        getchar(); 
    }//end else
    
    fclose(fi);
}//end main 


void toupper(char *text)
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


int bsort(struct record *number, int num, int new_rec)
{
    int sorted=0; //sorting flag 
    int i=0; //counter 
    char temp[48]; //temp value to store the swapped strings 
    char temp1[48]; //temp value for sorting 
    
    while(!sorted)
    {
        sorted=1;
    
        for(i=0;i<num+1;i++)
        {
            //if i is greater than i+1
            if (strcmp(number[new_rec].key,number[i].key)>0)
            {
                sorted=0;
                
                //swap the upper case names around 
                strcpy(temp,number[new_rec].key);
                strcpy(number[new_rec].key,number[i].key);
                strcpy(number[i].key,temp);
                
                //swap the first names around
                strcpy(temp,number[new_rec].first);
                strcpy(number[new_rec].first,number[i].first);
                strcpy(number[i].first,temp);
                
                //swap the second names around 
                strcpy(temp,number[new_rec].last);
                strcpy(number[new_rec].last,number[i].last);
                strcpy(number[i].last,temp);
                
                //swap the address around 
                strcpy(temp,number[new_rec].addr);
                strcpy(number[new_rec].addr,number[i].addr);
                strcpy(number[i].addr,temp);
            }//end if
        }//end for
    }//end while
}//end bsort 