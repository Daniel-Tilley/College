/* Part 1 
Given a file containing records of the form 
struct record
{
    char first[16];
    char last[16];
    char addr[48];
    int sales;
};
stored in a binary file, sales.bin
create a program which reads the file, and creates a file bonus.bin, 
containing the quarterly bonuses to be paid to each worker who has made over 100000 in sales, 
at the rate of 10% of sales over 100000 The file should be in order of bonus size, and should contain records of the form:
struct record
{   
    char first[16];
    char last[16];
    char addr[48];
    int bonus;
};

Part 2
Update the program to allow annual bonuses to be calculated from four quarters' data, stored in four files: q1.bin q2.bin q3.bin q4.bin

Author: Daniel Tilley 
Date: 17/03/2015
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//structure template 
struct record 
{
    char first[16];
    char last[16];
    char addr[48];
    int sales;
};
struct record *data; //declare structure array 
    
struct record_b
{
    char first[16];
    char last[16];
    char addr[48];
    int bonus;
};
struct record_b *data_b; //declare structure array for bonus 
    
//function prototype 
void sort(struct record_b *,int);
    
main()
{
    
    int i=0; //counter in loops
    int j=0; //counter in loop 
    int size=100; //size of array element
    int size_b=100; //size of array element
    int *annual_bonuses;
    int *array_temp;
    char file1[41]; //name of file to open
    char file2[41]; //file name to print data to
    data=(struct record *)malloc(size*sizeof(struct record)); //allocate size of array for data 
    FILE * fi,* fo; //file pointers
    
    //ask user for file name to read from
    printf("Please enter the file name you wish to open to read from:\n\n");
    gets(file1);
    
    fo=fopen("Sales.txt","w+");
    
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
            
            //print binary file to txt file.
            fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Sales: %d\n\n",data[i].first,data[i].last,data[i].addr,data[i].sales);
        }//end while
        
        //close file
        fclose(fi);
        
        printf("\nNumber of records is: %d\n",i);
        
        //tell user .txt file has been created and close text file.
        printf("\nContents of binary file have been printed to \"Sales.txt\"\n");
        fclose(fo);
        
        //allocate size of array for data_b
        data_b=(struct record_b *)malloc(size_b*sizeof(struct record_b)); 
        
        j=0;
        
        //copy the data
        for(i=0;i<size;i++)
        {
            //if sales are greater than 100000
            if(data[i].sales>100000)
            {
                strcpy(data_b[j].first,data[i].first);
                strcpy(data_b[j].last,data[i].last);
                strcpy(data_b[j].addr,data[i].addr);
                data_b[j].bonus=((data[i].sales*.10)/12*3);
                j++;
                
                //if the array is not big enough, resize it.
                if(j>size_b-2)
                {
                    size_b=size_b+100;
                    data_b=(struct record_b *)realloc(data_b,size_b*sizeof(struct record_b));
                }//end inner if
            }//end if
        }//end for
        
        //call sort function
        sort(data_b,size_b);
        
        //open file for writing
        fo=fopen("Bonus.bin","wb+");
        for(i=0;i<size_b;i++)
        {
            //if data is empty, stop printing 
            if(data_b[i].bonus==0)
            {
                break;
            }//end if
            
            //write new data to file 
            fwrite(&data_b[i], sizeof(struct record_b) , 1, fo);
        }//end for
        fclose(fo);
        
        //print new contents to changed address file 
        fo=fopen("Bonus.txt","w+");
        for(i=0;i<size_b;i++)
        {
            //if data is empty, stop printing 
            if(data_b[i].bonus==0)
            {
                break;
            }//end if
            
            //print new data to text file 
            fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Bonus: %d\n\n",
            data_b[i].first,data_b[i].last,data_b[i].addr,data_b[i].bonus);  
        }//end for
        fclose(fo);
        
        //tell user new file has been printed 
        printf("\nNew records sent to \"Bonus.bin\" and \"Bonus.txt\"\n");
        
        //assign memory size to arrays
        array_temp=(int *)malloc(size_b*sizeof(int));
        annual_bonuses=(int *)malloc(size_b*sizeof(int));
        
        //copy bonuses to arrays
        for(i=0;i<size_b;i++)
        {
            array_temp[i]=data_b[i].bonus;
            annual_bonuses[i]=0;
        }//end for
        
        //print quater files 
        for(i=1;i<5;i++)
        {
            //name file 
            sprintf(file2,"q%d.bin",i);
            //open file
            fo=fopen(file2,"wb+");
            
            for(j=0;j<size_b;j++)
            {
                //if data is empty, stop printing 
                if(data_b[j].bonus==0)
                {
                    break;
                }//end if
            
                //write new data to file 
                fwrite((const void*) & array_temp,sizeof(int),1,fo);
            }//end for
            fclose(fo);
        }//end while 
        
        //telll user quater files have been created 
        printf("\nQuaterly bin files created\n");
        
        //read in quaterly figures
        for(i=1;i<5;i++)
        {
            //name file 
            sprintf(file2,"q%d.bin",i);
            //open file
            fi=fopen(file2,"rb");
            
            for(j=0;j<size_b;j++)
            {
                //scan numbers 
                fscanf(fi,"%d",&array_temp[j]);
                
                //calculate annual bonuses figures 
                annual_bonuses[j]=array_temp[j]+annual_bonuses[j];
                
                //close file 
                fclose(fi);
            }//end for
        }//end for 
        
        //print annual bonus figures to document        
        fo=fopen("Annual_Bonus.txt","w+");
        for(i=0;i<size_b;i++)
        {
            //if data is empty, stop printing 
            if(data_b[i].bonus==0)
            {
                break;
            }//end if
            
            //print new data to text file 
            fprintf(fo," Firstname: %s \n Lastname: %s\n Address:%s Annual Bonus: %d\n\n",
            data_b[i].first,data_b[i].last,data_b[i].addr,annual_bonuses[i]);  
        }//end for
        fclose(fo);
        
        //tell user new file has been printed 
        printf("\nNew records sent to \"Annual_Bonus.bin\" and \"Annual_Bonus.txt\"\n");
    }//end if 
    
    else
    {
        //print error 
        printf("\nFile cannot be opened\n");
        
        //close file 
        fclose(fi);
    }//end else
    
    //keeps program open
    getchar();
}//end main

void sort(struct record_b *data_b, int size_b)
{
    
    int i=0; //counter in loop
    int j=0; //counter in loop
    int k=0; //position in loop
    int min; //min value 
    int temp_num; //temp storage 
    char temp[48]; //temp storage
    
    for(i=0;i<size_b-1;i++)
    {
        //set min to first number 
        min=data_b[i].bonus;
        for(j=(i+1);j<size_b;j++)
        {
            //if any data is blank, break.
            if (data_b[j].bonus==0)
            {
                break;
            }//end if
            
            //if any number is smaller iit becomes the new min
            if (data_b[j].bonus<min)
            {
                min=data_b[j].bonus;
                k=j;
            }//end if
        }//end for
        
        //copy data
        temp_num=data_b[k].bonus;
        data_b[k].bonus=data_b[i].bonus;
        data_b[i].bonus=temp_num;
    
        strcpy(temp,data_b[k].first);
        strcpy(data_b[k].first,data_b[i].first);
        strcpy(data_b[i].first,temp);
        
        strcpy(temp,data_b[k].last);
        strcpy(data_b[k].last,data_b[i].last);
        strcpy(data_b[i].last,temp);
        
        strcpy(temp,data_b[k].addr);
        strcpy(data_b[k].addr,data_b[i].addr);
        strcpy(data_b[i].addr,temp);
    }//end for
}//end sort