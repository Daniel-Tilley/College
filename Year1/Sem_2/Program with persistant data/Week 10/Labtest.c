/* Programming with persistant data lab test 

Author: Daniel Tilley 
Date: 25/03/2015
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//structure template 
struct record 
{
    int student_num;
    char first[16];
    char last[16];
    char addr[48];
    int tutor_id;
};
struct record *data; //declare structure array 
    
main()
{
    //declare variables 
    int i=0; //counter in loops
    int j=0; //counter in loop
    int size=50; //size of array element
    int num=1; //starting student number 
    int tutor_group=1; //tutor groups to be assigned to students
    int num_records=0; //number of records in data 
    data=(struct record *)malloc(size*sizeof(struct record)); //allocate size of array for data 
    char file1[41]; //file name 
    FILE *fi,*fo1,*fo2; //file handles 
    
    printf("Please enter the name of the file you wish to open:\n");
    gets(file1);
    
    //open file for reading, if opened successfully
    if((fi=fopen(file1,"r"))!=NULL)
    {
        printf("\nfile 1 opened sucessfully\n");
        
        //loop to read in data 
        for(i=0;i<size;i++)
        {
            /*
            //if array is too small
            if(i>size-2)
            {
                size=size+50;
                data=(struct record *)realloc(data,size*sizeof(struct record));
            }//end if
            
            */
            //assign students with student id 
            data[i].student_num=num;
            //set tutor id to 0 for error checking 
            data[i].tutor_id=0;
            //error checking 
            strcpy(data[i+1].first,"*");
            
            printf("\n%d",i);
            //increment student number 
            num++;
            
            //read in names
            fgets(data[i].first,16,fi);
            for(j=0;j<17;j++)
            {
                if(data[i].first[j]=='\n'||data[i].first[j]=='\0')
                {
                    data[i].first[j]='\0';
                }//end if
            }//end for
            
            fgets(data[i].last,16,fi);
            for(j=0;j<17;j++)
            {
                if(data[i].first[j]=='\n'||data[i].first[j]=='\0')
                {
                    data[i].first[j]='\0';
                }//end if
            }//end for
            
            //read in address 
            fgets(data[i].addr,48,fi);
            for(j=0;j<49;j++)
            {
                if(data[i].first[j]=='\n'||data[i].first[j]=='\0')
                {
                    data[i].first[j]='\0';
                }//end if
            }//end for
        }//end for 
        fclose(fi);
        
        printf("\nData read in sucessfully\n");
        
        //count number of records 
        for(i=0;i<size;i++)
        {
            //if the data is empty the break out of the counter 
            if(strcmp(data[i].first,"*")==0)
            {
                break;
            }
            
            //increment the number of records 
            num_records++;
        }//end for 
        
        //find out the number of students in each group 
        num_records=(num_records/12);
        
        //assign tutor groups to students 
        for(i=0;i<12;i++)
        {
            for(j=0;j<num_records;j++)
            {
                data[i].tutor_id=tutor_group;
            }//end inner for
            tutor_group++;
        }//end for
        
        //open file for writing
        fo1=fopen("students.db","wb+");
        fo2=fopen("students.txt","w+");
        
        printf("\nFile 2 opened sucessfully\n");
        
        for(i=0;i<size;i++)
        {
            //if data is empty, stop printing 
            if(data[i].tutor_id==0)
            {
                break;
            }//end if
            
            //write new data to file 
            fwrite(&data[i],sizeof(struct record),1, fo1);
            fprintf(fo2,"Name: %s %s\nAddress: %s\nStudent Number: %d\nTutor Group: %d\n\n",data[i].first,data[i].last,data[i].addr,data[i].student_num,data[i].tutor_id);
        }//end for
        fclose(fo1);
        fclose(fo2);
        
        printf("\nData written sucessfully\n");
    }//end if 
    
    //if file not opened sucessfully 
    else
    {
        printf("\nFile cannot be opened\n");
    }//end else
    
    //keeps program open
    getchar();
    
}//end main
