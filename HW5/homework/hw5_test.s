@DATA SECTION
    .data 
    .align 4

    .type a,%object
    .size a,80
a:
    .word 1,2,3,4,5,6,7,8,9,0,3,2,1,2,4,3,7,1,9,2

    .type b,%object 
    .size b,36
b:
    .word 1,1,0,0,3,1,2,1,1

format:
    .ascii "number is %d\n"

@TEXT SECTION
    .section .text
    .global main
    .type main,%function

.matrix:
    .word a
    .word b

.address_format:
    .word format

main:
    MOV ip,sp   
    STMFD sp!,{fp,ip,lr,pc} //在函數調用的第一個時間壓棧。
    SUB fp,ip,#4
    /*
    begin of your function 
    r0 <= address of the kernel matrix
    r1 <= address of the input matrix
    r2 <= Number of rows of the input matrixr
    r3 <= number of columns of the input matrix
    */
    LDR r0 , .matrix+4 //r0是kernel記憶體位置
    LDR r1 , .matrix //r1是被卷積矩陣記憶體位置
    MOV r2 , #4
    MOV r3 , #5
    bl conv
    /*---end of your function--- */
    //print
    MUL r4 , r2 , r3
    LDR r0 , .address_format
Showloop:
    cmp r4 , #0
    BEQ _exit
    SUB r4 , r4 , #1
    LDR r6 , [r5] , #4
    MOV r1 , r6
    bl printf
    B Showloop
_exit:
    LDMEA fp,{fp,sp,pc}
    nop
    .end







