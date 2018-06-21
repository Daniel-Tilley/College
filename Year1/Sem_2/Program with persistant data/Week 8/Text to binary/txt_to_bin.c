/* This is a progarm that convers .txt files to binary 

Author: Daniel Tilley 
Date: 10/03/2015
*/

#include <stdio.h>
#include <stdlib.h>

//structure template 
struct record 
{
    char first[16];
    char last[16];
    char addr[48];
    char key[32];
};
struct record *data; //declare structure array 

main()
{
    int i=0; //counter in loop 
    int size=100; //size of array 
    char file1[41]; //name of file to open 
    data=(struct record *)malloc(size*sizeof(struct record));
    FILE * fi,* fo; //file pointers 
    
    //ask user for file name to read from
    printf("Please enter the file name you wish to open to read from:\n");
    gets(file1);
    
    fo=fopen("MyData.bin","wb+");
    
    //open file for binary reading, if opened successfully
    if((fi=fopen(file1,"r"))!=NULL)
    {
        //as long as reading records succeeds, store them in the array
        for(i=0;i<size;i++)
        {
            //if the array is not big enough, resize it.
            if(i>size-2)
            {
                size=size+100;
                data=(struct record *)realloc(data,size*sizeof(struct record));
            }//end if
            fscanf(fi,"%s %s",number[i].name_first,number[i].name_second);
            //print text file to bin file.
            fprintf(fo," %s\n %s\n %s\n %s\n\n",data[i].first,data[i].last,data[i].addr,data[i].key);
        }//end while 
        
        //tell user .txt file has been created and close text file.
        printf("Contents of text file has been printed to \"MyData.bin\"\n");
    }//end if
    
    else
    {
        //print error 
        printf("\nFile cannot be opened\n");
    }//end else
    
    fclose(fi);
    fclose(fo);
    
    //keeps program open
    getchar();
}//end main 