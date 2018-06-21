#include <stdio.h>

main()
{
    //pointer for file
    FILE *fp;
    
    //string of file name 
    char filename[20];
    
    printf("\n\nPlease enter the file name you wish to open:");
    gets(filename);
    
    //opens the file 
    fp=fopen(filename, "r");
    
    //checks if the file has been opened successfully 
    if (fp==NULL)
    {
        printf("\n\n ERROR: file is not found for opening\n\n");
    }//end else
    
    else 
    {
        printf("\n\n File was successfully opened\n\n");
        fclose(fp);
        printf("\n\n File has been closed\n\n");
    }//end else
    
    getchar();
}//end main