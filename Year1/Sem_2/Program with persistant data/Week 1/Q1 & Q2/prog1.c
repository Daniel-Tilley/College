#include <stdio.h>

main()
{
    FILE *fp;
    
    fp=fopen("prog.c", "r");
    
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