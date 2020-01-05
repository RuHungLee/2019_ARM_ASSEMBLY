這次作業是以 C function call assembly code，其餘部分和上兩次作業其實沒有什麼差別。
C function call assembly code最特別的應該就是extern的部分，引入以後後使用一般的C
語言函數的差別也不大。

這次作業遇到最大的困難就是os上的問題。原先作業我都在windows環境下編寫和執行，但是
這次作業windows在使用insight時出了一些問題，具體原因我也不曉得，總之最後我把程序
移到Linux環境下就能正常執行了。

C語言程式碼如下，

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

之所以沒有定義result是因為conv function會調用malloc並會傳位置。

