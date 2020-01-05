#include <stdio.h>
#include <stdlib.h>
#include <xmmintrin.h>
#define ROW 400
#define COLUMN 400
using namespace std;
int main(){
    int i , j , k , m;
    float v; 
    //使用SIMD運算資料需要做對齊，對齊位是16*。
    float A[ROW][COLUMN] __attribute__((aligned(16)));
    float B[4] __attribute__((aligned(16)));
    float ANS[ROW] __attribute((aligned(16)));
    float total;
    FILE *fp , *fout;
    fp = fopen("data.txt","r"); 
    fout = fopen("output.txt","w");
    for (i=0; i<ROW; i++) {
        for (j=0; j<COLUMN; j++) {
            fscanf(fp, "%f", &A[i][j]);
        }
    }
    //宣告三個cpp __m128類指針
    __m128 *a , *b , *c;
    for(i=0;i<ROW;i++){
        total = 0;
        for(j=0;j<COLUMN;j++){
            for(k=0;k<100;k++){
                //每次平行執行4個整數乘法。
                a = (__m128 *)(A[i]+4*k);
                b = (__m128 *)(A[j]+4*k);
                c = (__m128 *)B;
                *c = _mm_mul_ps(*a,*b);
                for(m=0;m<4;m++){total+=B[m];}
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

