/* Prompt the user for two filenames and minimum line length,
and output only lines of at least that length in the first file to the second file. 
Author: Daniel Tilley
Date: 17/02/2015
*/

#include <stdio.h>

main()
{
    
    char file1[40]; //file1 name
    char file2[40]; //file2 name 
    char line[201]; //line to read 
    int min_lenght; //minimum line lenght 
    int lenght; //line lenght
    FILE *fp1, *fp2; //file pointers
    
    //display message asking user to enter values and prompt for names 
    printf("Please enter the first file name\n");
    gets(file1);
    
    printf("\nPlease enter the second file name\n");
    gets(file2);
    
    printf("\nPlease enter the minimum file lenght:\n");
    scanf("%d",&min_lenght);
    flushall();
    
    //open file 
    fp1 = fopen(file1,"r");
    fp2 = fopen(file2,"w+");
    
    if (file1==NULL || file2==NULL)
    {
        printf("\nError opening file, please try again.");
    }
    
    else
    {
        printf("\nFiles opened sucessfully.\n");
        
        //Every time reading a line into "line" is successful
        while(fgets(line,201,fp1)!=NULL)
        {
			lenght=0;
			
            //if we haven't reached the null terminator yet the string is longer than lenght
            while(line[lenght]!='\0')
            {
                lenght++;
            }//end while 
            
            if (lenght>=min_lenght)
            {
                //write output to scond file 
               fputs(line,fp2);
            }//end if
        }//end while 
        
        printf("\nFiles copied sucessfully.");
        
        fclose(fp1);
        fclose(fp2);
    }//end else
    
    //keeps file open
    getchar();
}//end main
    
    