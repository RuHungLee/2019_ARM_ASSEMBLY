#include <stdio.h>
#include <stdlib.h>
#include <xmmintrin.h>
#define ROW 400
#define COLUMN 400

int main(){
    //test1
    int i , j , k , m;
    float v; 
    float A[ROW][COLUMN];
    float ANS[ROW];
    float total;
    //read file
    FILE *fp;
    fp = fopen("data.txt","r"); // Open a file for reading.
    for (i=0; i<ROW; i++) {
        for (j=0; j<COLUMN; j++) {
            fscanf(fp, "%f", &A[i][j]);
        }
    }

    for(i=0;i<ROW;i++){
        total = 0;
        for(j=0;j<COLUMN;j++){
            for(k=0;k<400;k++){
                total+=A[i][k]*A[j][k];
            }
        }
        ANS[i] = total;
    }
    for(i=0;i<ROW;i++){printf("%f\n",ANS[i]);}
    return 0;
}

