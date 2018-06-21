/* Q2 pq 144
Author: Daniel Tilley 
Date: 24/03/2015
*/

#include <stdio.h>

struct data
{
    int a;
    float b;
}; 
struct data d, *p=&d;
    
main()
{
    
    d.a=1;
    p->a=1;
    (*p).a=1;
    
    d.b=2.3;
    p->b=2.3;
    (*p).b=2.3;
}//end main 
