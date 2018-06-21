#include<stdio.h>
#include<time.h>
#include<time.h>
int main(){
  struct timeval t_0, t_1;
  double millis;
  char c;
  char filename[50];
  FILE *f_in;
  printf("Enter filename to access: \n");
  scanf("%s",filename);

  gettimeofday(&t_0,0);             //Time Start

  f_in=fopen(filename,"r");         ////////The
  if(f_in)                          ////////Timed
    c=fgetc(f_in);                  ////////Section

  gettimeofday(&t_1,0);             //Time End

  millis=t_1.tv_usec/1000.0-t_0.tv_usec/1000.0;
  printf("Time to access file: %s : %f milliseconds\n",filename,millis);
  fclose(f_in);
}