/*This is a program that performs the following operations and displays the result:
15 + 10, 15–10, 15 * 10, 15 / 10, 15 % 3
Author: Daniel Tilley 
Date: 30/09/2014
*/

#include <stdio.h>
main()
{
    int ans1,ans2,ans3,ans5;
    float ans4;
    
    ans1 = 15+10;
    ans2 = 15-10;
    ans3 = 15*10;
    ans4 = 15/10;
    ans5 = 15%3;
    
    printf(" 15+10 is %d\n",ans1);
    printf(" 15-10 is %d\n",ans2);
    printf(" 15*10 is %d\n",ans3);
    printf(" 15/10 is %f\n",ans4);
    printf(" 15/3 is %d\n",ans5);
    
    getchar();
    
}//endmain