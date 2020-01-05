    .section .text
    .global conv
    .type conv,%function
conv:
    MOV ip,sp   
    STMFD sp!,{r4-r10,fp,ip,lr,pc} //在函數調用的第一個時間壓棧。
    SUB fp,ip,#4
    MOV r4 , r0
    PUSH {r1-r3,fp,ip}
    MOV r0 , #28
    bl malloc
    POP {r1-r3,fp,ip}
    SUB r2 , r2 , #2 //rows
    SUB r3 , r3 , #2 //cols
    MOV r5 , #0
    MOV r6 , #0
    MOV r8 , r0 
//convolution=============

outer_loop: //列
    CMP r5 , r2
    ADD r5 , r5 , #1
    MOV r6 , #0
    BNE inner_loop
    B _exit
inner_loop: //行 r5(1,2) r6(1,2,3)
    CMP r6 , r3
    ADD r6 , r6 , #1
    BEQ outer_loop
    PUSH {r1-r10}

    //被卷積矩陣該次卷積 offset=(r5-1)*20+(r6-1)*4 
    MOV r9 , #20
    MOV r3 , #4
    SUB r5 , r5 , #1
    SUB r6 , r6 , #1
    MUL r5 , r9 , r5
    MUL r6 , r3 , r6
    ADD r2 , r5 , r6
    ADD r2 , r1 , r2 

    //進行卷積 r2為被卷積矩陣第一個位置，r4為kernel第一個位置。
    LDMIA r2 , {r3 , r5 , r10}
    LDMIA r4!, {r6 , r7 , r8}
    MUL r9 , r3 , r6
    MLA r9 , r5 , r7 , r9
    MLA r9 , r10 , r8 , r9

    ADD r2 , r2 , #20
    LDMIA r2 , {r3 , r5 , r10}
    LDMIA r4!, {r6 , r7 , r8}
    MLA r9 , r3 , r6 , r9
    MLA r9 , r5 , r7 , r9
    MLA r9 , r10 , r8 , r9

    ADD r2 , r2 , #20
    LDMIA r2 , {r3 , r5 , r10}
    LDMIA r4!, {r6 , r7 , r8}
    MLA r9 , r3 , r6 , r9
    MLA r9 , r5 , r7 , r9
    MLA r9 , r10 , r8 , r9

    STR r9 , [r0] , #4

    POP {r1-r10}
    B inner_loop
//========================
_exit:
    MOV r0 , r8
    LDMEA fp,{r4-r10,fp,sp,pc}
    //now r0 is the address of requested memory


    