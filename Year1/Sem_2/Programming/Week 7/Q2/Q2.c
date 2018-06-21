/* write a program that has a list of countries and capital cities stored in memory 
if a person enters a country, display back its capital city 
Author: Daniel Tilley 
Date: 03/03/2015
*/

#include <stdio.h>
#include <string.h>
#define SIZE 5

main()
{
    
    int i;
    int flag;
    char *country[SIZE]={"America","China","Ireland","Scotland","Wales"};
    char *capitals[SIZE]={"Washington","Bejing","Dublin","Endinborough","Cardiff"};
    char value[SIZE];
    
    puts("Please enter your country:\n");
    gets(value);
    flushall();
    
    for(i=0;i<SIZE;i++)
    {
        if(strcmp(value,*(country+i))==0)
        {
            printf("\nThe cap of %s is %s",value,*(capitals+i));
            flag=1;
            break;
        }//end if 
        
        else 
        {
            flag=0;
        }
    }//end for 
    
    if (flag==0)
    {
        printf("\n%s???? do you not mean MURICAAAAAAAAA?????",value);
    }//end if 
    
    getchar();
    
}