/* This is a program that will calculate and display the sum of 5 integers from 1 to 5 and also 
Calculate and display the average of the following floating point numbers: 1.0, 1.1, 1.2, ..... 2.0
Author: Daniel Tilley
Date: 30/09/2014
*/

#include <stdio.h>
main()
{
    //first part of program
    int var1,var2,var3,var4,var5,ans1;
    
    //Second part of code    
    float v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,ans2;
   
    var1=1;
    var2=2;
    var3=3;
    var4=4;
    var5=5;
    ans1=0;
    
    ans1 = var1 + var2 + var3 + var4 + var5;
    
    printf("Sum of 5 intergers = %d\n",ans1);

    //Second part of code    
    v1=1.0;
    v2=1.1;
    v3=1.2;
    v4=1.3;
    v5=1.4;
    v6=1.5;
    v7=1.6;
    v8=1.7;
    v9=1.8;
    v10=1.9;
    v11=2.0;
    ans2=0;
    
    ans2 = (v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8 + v9 + v10+ v11)/10;
    
    printf("The average of 10 floats = %f",ans2);
    
    getchar();
    
}//end main
    
    
    
    

    
    