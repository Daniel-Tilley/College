/*Prompt the user for two filenames. 
The first should be a file formatted as a list with each line in the form:

filename min

filename is a string and min is an int

Scan each entry, and copy lines from that file of at least min characters to the output file 
(the second filename entered by the user)
Author: Daniel Tilley 
Date: 17/02/2015
*/

#include <stdio.h>

main()
{
    
    char file1[40]; //file1 name
    char file2[40]; //file2 name 
    char file_t[201]; //file name to read
    char line[201]; //line to read
    int min_lenght; //minimum line lenght 
    int lenght; //line lenght
    int i; //counter
    FILE *fp1, *fp2, *fp3; //file pointers
    
    //display message asking user to enter values and prompt for names 
    printf("Please enter the first file name\n");
    gets(file1);
    
    printf("\nPlease enter the second file name\n");
    gets(file2);
    
    //open file 
    fp1 = fopen(file1,"r");
    fp2 = fopen(file2,"w+");
    
    if (file1==NULL || file2==NULL)
    {
        printf("\nError opening file, please try again.");
    }
    
    else
    {
        printf("\nFiles opened sucessfully.\n",file1);
        
        //Every time reading a line into "line" is successful
        while(fgets(line,201,fp1)!=NULL)
        {
            //scans minimum lenght
			fscanf(fp1, "%*c%*[^\"]\" %d", &min_lenght);
            
            //sets file one string equal to another 
            for(i=1;i<202;i++)
            {
                file_t[i]=line[i];
            }//end for
            
            //open file 3 for checking 
            fp3 = fopen(file_t,"r");
            
            //check if opened sucessfully or not
            if (line==NULL)
            {
                printf("\nError opening %s, please try again.",file_t);
            }//end if
            
            else
            {
                //print message saying file opened sucessfully
                printf("\nFile 3 opened sucessfully\n");
                
                while(fgets(line,201,fp3)!=NULL)
                {
                    lenght=0;
			
                    //if we haven't reached the null terminator yet the string is longer than lenght
                    while(line[lenght]!='\0')
                    {
                        lenght++;
                    }//end inner inner while 
            
                    if (lenght>=min_lenght)
                    {
                        //write output to scond file 
                        fputs(line,fp2);
                    }//end inner if
                }//end inner while 
            }//end else
        }//end while 
        
        //print message saying files opened sucessfully and close files
        printf("\nFiles copied sucessfully.");
        
        fclose(fp1);
        fclose(fp2);
        fclose(fp3);
    }//end else
    
    //keeps file open
    getchar();
}//end main
