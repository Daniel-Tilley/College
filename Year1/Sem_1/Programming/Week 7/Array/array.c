#include <stdio.h>
#define SIZE 10
main()
{
    
    int ages [SIZE];
    int youngest, oldest, total_age;
    int i;
    
    youngest=oldest=total_age=0;
    
    printf("Enter the ages of %d people\n",SIZE);
    
    for (i=0 ; i < SIZE ; i++);
    {
        scanf("%d",&ages[i]);
        total_age=total_age+ages[i];
    }
    
    youngest=ages [0];
    oldest=ages [0];
    
    for ( i=0 ; i<SIZE ; i++)
    {
        if (ages [i] > oldest)
        {
            oldest = ages [i];
        }//end if
        
        if (ages [i] < youngest)
        {
            youngest = ages [i];
        }//end if
    }//end for
    
    printf("\n The youngest age is %d",youngest);
    printf("\n The oldest age is %d",oldest);
    printf("\n The average age is % .1f",(float)total_age/SIZE);
    
    getchar();
    getchar();
    
}//end main
    
    