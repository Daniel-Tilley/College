/* This program uses the modulus operator to calculate and display the remainder
for the following arithmetic operations: 2 % 2, 3 % 2, 5 % 2, 7 % 3, 100 % 33, 100 % 7
Author: Daniel Tilley
Date: 30/09/2014
*/

#include <stdio.h>
main()
{
    int v1,v2,v3,v4,v5,v6,ans1,ans2,ans3,ans4,ans5,ans6;
    
    v1=2;
    v2=3;
    v3=5;
    v4=7;
    v5=33;
    v6=100;
    ans1=ans2=ans3=ans4=ans5=ans6=0;
    
    ans1 = v1%v1;
    ans2 = v2%v1;
    ans3 = v3%v1;
    ans4 = v4%v2;
    ans5 = v6%v5;
    ans6 = v6%v4;
    
    printf("The remainder of 2/2 is %d\n",ans1);
    printf("The remainder of 3/2 is %d\n",ans2);
    printf("The remainder of 5/2 is %d\n",ans3);
    printf("The remainder of 7/3 is %d\n",ans4);
    printf("The remainder of 100/33 is %d\n",ans5);
    printf("The remainder of 100/7 is %d",ans6);
    
    getchar();
}//endmain
    