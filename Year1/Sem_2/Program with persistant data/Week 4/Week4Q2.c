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
	
    char line1[81];//line read from file
	char line2[81];//line read from file
	FILE *fi1, *fi2, *fo; //file handles
	char filename[40];
	
    printf("Please enter input filename 1: \n");
	scanf("%s",filename);
	
    if((fi1=fopen(filename,"r"))!=NULL)
    {//If file open is successful
		
        printf("Please enter input filename 2: \n");
		scanf("%s",filename);
		
        if((fi2=fopen(filename,"r"))!=NULL)
        {//If file open is successful
			
            printf("Please enter output filename: \n");
			scanf("%s",filename);
			
            if((fo=fopen(filename,"w"))!=NULL)
            {//If file open is successful

				int f1=1,f2=1;//flags to determine content still to be read
				
                while (f1!=0||f2!=0)
                    {//while at least one file has data to be read
                        if(f1!=0)//if file 1 has data
                        {
                            f1=fgets(line1,81,fi1);//read line from file 1 and set flag
                        }//end if
                        if(f2!=0)
                        {
                            f2=fgets(line2,81,fi2);
                        }//end if
					
                        if(f1!=0)//if file 1 successfully read
                        {
                            fputs(line1,fo);//write output to out file
                        }//end if
                        if(f2!=0)
                        {
                            fputs(line2,fo);
                        }
                    }
			}
            
            else
            {
				printf("Error opening file");
            }//end else
		}//end if
        else
        {
			printf("Error opening file");
        }//end else
	}
    else
    {
		printf("Error opening file");
    }//end else
fclose(fo);
fclose(fi1);
fclose(fi2);
}