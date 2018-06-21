/* PG 145 Q3
Author: Daniel Tilley
Date: 10/03/2015
*/

#include <stdio.h>

struct stock_record
{
    int no;
    char description[21];
    float price;
    int qty;
};

main()
{
    
    //intialise structure 
    struct stock_record stock_item=
    {
        1234,
        "Some Stock",
        20.99,
        2
    };
    
    //print initialised values 
    printf("\nStock Number: %d\n",stock_item.no);
    printf("Stock Description: %s\n",stock_item.description);
    printf("Price: % .2f\n",stock_item.price);
    printf("Quantity: %d\n",stock_item.qty);
    
    //read in values 
    printf("\nPlease enter the stock number:\n");
    scanf("%d",&stock_item.no);
    flushall();
    
    printf("\nPlease enter the product description\n");
    gets(stock_item.description);
    flushall();
    
    printf("\nPlease enter the price\n");
    scanf("%f",&stock_item.price);
    flushall();
    
    printf("\nPlease enter the quantity\n");
    scanf("%d",&stock_item.qty);
    flushall();
    
    //print values that have been read in 
    printf("\nStock Number: %d\n",stock_item.no);
    printf("Stock Description: %s\n",stock_item.description);
    printf("Price: % .2f\n",stock_item.price);
    printf("Quantity: %d",stock_item.qty);
    
    getchar();
    
}//end main 
    
    
    