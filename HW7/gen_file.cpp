#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROW 400	
#define COLUMN 400

int main(void)
{
   FILE *fp;
   int i, j;
   
   fp = fopen("./data.txt","w");

   srand48(time(0)); 
   for (i=0; i<ROW; i++) {
      for (j=0; j<COLUMN; j++) {
         fprintf(fp, "%f ", (float) drand48());
      }
      fprintf(fp, "\n");
   }

   fclose(fp);

   return 0;
}
