#include<stdlib.h>
#include<stdio.h>
extern int *conv(int *kernel, int *matrix , int row , int col);
int main(){
    int *Matrix , *result , row , col , i , kernel[] = {0,1,2,3,4,5,6,7,8};
    scanf("%d %d" , &row , &col);
    Matrix = (int *)malloc(sizeof(int)*row*col);
    for(i=0;i<row*col;i++){Matrix[i] = i;}
    //r0->kernel address , r1->Matrix , r2->row(4) , r3->col(5)
    result = conv(kernel,Matrix,row,col);
    return 0;
}