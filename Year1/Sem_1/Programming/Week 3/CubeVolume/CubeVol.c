/* This is a program to calculate and display the volume of a cube. The length of all sides
of the cube is 2.8 m. 
Author: Daniel Tilley
Date: 30/09/2014
*/

#include <stdio.h>
main()
{
    float v1,ans;
    
    v1=2.8;
    ans=0;
    
    ans = v1*v1*v1;
    
    printf("The volume of the cube is %f",ans);
    
    getchar();
    
}//endmain

    