#include<stdlib.h>
#include<stdio.h>
extern int *conv(int *kernel, int *matrix , int row , int col);
int main(){
    int *result , row , col , i;
    int kernel[] = {0,1,2,2,1,0,0,1,2};
    int Matrix[] = {0,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,10};
    row = 4; col = 5;
    result = conv(kernel,Matrix,row,col);
    for(i=0;i<6;i++){printf("[%d]",result[i]);}
    return 0;
}
