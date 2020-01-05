#include <stdio.h>
#include <stdlib.h>
#include <xmmintrin.h>
#define ROW 400
#define COLUMN 400

int main(){
    //test1
    int i , j , k , m;
    float v; 
    float A[ROW][COLUMN] __attribute__((aligned(16)));
    float B[4] __attribute__((aligned(16)));
    float ANS[ROW] __attribute((aligned(16)));
    float total;
    //read file
    FILE *fp;
    fp = fopen("data.txt","r"); // Open a file for reading.
    for (i=0; i<ROW; i++) {
        for (j=0; j<COLUMN; j++) {
            fscanf(fp, "%f", &A[i][j]);
        }
    }
    __m128 *a , *b , *c;
    for(i=0;i<ROW;i++){
        total = 0;
        for(j=0;j<COLUMN;j++){
            for(k=0;k<100;k++){
                a = (__m128 *)(A[i]+4*k);
                b = (__m128 *)(A[j]+4*k);
                c = (__m128 *)B;
                *c = _mm_mul_ps(*a,*b);
                for(m=0;m<4;m++){total+=B[m];}
            }
        }
        ANS[i] = total;
    }
    for(i=0;i<ROW;i++){printf("%f\n",ANS[i]);}
    return 0;
}

