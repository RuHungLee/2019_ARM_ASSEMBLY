#include <stdio.h>
#include <stdlib.h>
#include <xmmintrin.h>

#define ROW 400
#define COLUMN 400

void show(float matrix[ROW][COLUMN]){
   int i , j;
   for (i=0; i<ROW; i++) {
      for (j=0; j<COLUMN; j++) {
         printf("%f ", matrix[i][j]);
      }
      printf("\n");
   }
}

//__m128 _mm_mul_ps(__m128 a, __m128 b)
// r0 := a0 * b0 
// r1 := a1 * b1 
// r2 := a2 * b2 
// r3 := a3 * b3 

int main(void)
{

   FILE *fp;
   int i, j;
   float matrix[ROW][COLUMN] __attribute__((aligned(16)));
   fp = fopen("data.txt","r"); // Open a file for reading.
   for (i=0; i<ROW; i++) {
      for (j=0; j<COLUMN; j++) {
         fscanf(fp, "%f", &matrix[i][j]);
      }
   }
   

   

   show(matrix);
   fclose(fp);

   return 0;
}



