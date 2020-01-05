#include <stdio.h>
#include <stdlib.h>
#include <xmmintrin.h>
#define ROW 400
#define COLUMN 400
using namespace std;
int main(){

    int i , j , k , m;
    float v; 
    float A[ROW][COLUMN];
    float ANS[ROW];
    float total;
    FILE *fp , *fout;
    fp = fopen("data.txt","r");
    fout = fopen("output.txt","w");
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
    // for(i=0;i<ROW;i++){printf("%f\n",ANS[i]);}
    for(i=0;i<ROW;i++){
        fprintf(fout,to_string(ANS[i]));
        fprintf(fout," ");    
    }
    return 0;
}

