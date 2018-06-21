/* Write a program in c to display:

the number of lines over a user-supplied length in a file

the average length of these lines

the average length of all lines

the length of the longest line

Each output on a single line in the format "Name:Value"

Author Daniel Tilley
Date: 11/02/2015
*/

#include<stdio.h>
int main()
{
    
	int min;//minimum line size
	char filename[40];
	char line[201];//line read from file
	FILE *fi; //file handle
	int len; //length of line
	int lines=0;//number of lines over min characters
	int all_lines=0;//total lines in file
	int sum=0;//sum of characters in lines over min characters
	int all_sum=0;//sum of characters from all lines in file
	int longest=0; //length of longest line encountered
    
	printf("Please enter minimum number of characters per line\n");
	scanf("%d",&min);
	printf("\nMinimum number of characters per line is: %d\n",min);
	printf("\nPlease enter filename: \n");
	scanf("%s",filename);
	printf("File to read: %s\n", filename);
    flushall();
    
	if((fi=fopen(filename,"r"))!=NULL)
    {//If file open is successful
        
		while(fgets(line,201,fi)!=NULL)
        {//Every time reading a line into "line" is successful
			len=0;
            
			while(line[len]!='\0')//if we haven't reached the null terminator yet the string is longer than len
			{
                len++;//calculate length without strlen
                all_lines++;//increment total number of lines
                all_sum+=len;//increment total sum of characters
                
                if(len>=min)
                {//if line is at least min length
                    lines++;//increment number of lines of min length
                    sum+=len;//increment total number of characters in lines over min length
                }//end if
			}//end while 
            
			if( len>longest) 
            {
                longest=len;//if len exceeds longest, assign value of len to longest
            }//end if
		}//end while 
        
		printf("Number of Lines over %d characters: %d\n",min,lines);
		printf("Average length of lines over %d characters: %d\n",min,sum/lines);
		printf("Average length of all lines: %d\n",all_sum/all_lines);
		printf("Longest Line: %d characters\n",longest);
	}//end if
   
    else
    {
		printf("Error opening file");
    }//end else
    
    getchar();
}//end main