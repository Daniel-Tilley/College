/*  Ask the user for their name, compare the entered name with a list of names stored in 
memory, if the users name is on the list display a greeting, if not display "Name not found"
Author: Daniel Tilley 
Date: 03/03/2015
*/

#include <stdio.h>
#include <string.h>
#define SIZE 20

main()
{
    
    int i=0;
    int flag=0;
    char *string[SIZE]={"Daniel","John","Bobo","Johno","Gerorgie"};
    char name[SIZE];
    
    puts("Please enter your name");
    gets(name);
    
    for(i=0;i<SIZE;i++)
    {
        if(strcmp(name,*(string+i))==0)
        {
            flag=0;
            break;
        }//end if 
        
        else
        {
            flag=1;
        }//end else
    }//end for 
    
    if(flag==0)
    {
        printf("Hello %s",name);
    }
    
    else
    {
        printf("G'way will ye");
    }
    
    getchar();
    
}//end main