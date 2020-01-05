407410050 李如弘
這次作業要完成的是矩陣的convolution，總共回對矩陣做6次卷積，生成6個空間的矩陣。
首先要在data setcion內定義需要使用到的記憶體。

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
    .word 1,1,0,0
	
	,3,1,2,1,1

    .type c,%object
c:
    .space 24, 0
	
並且在text section內載入需要用到的記憶體位置。
@TEXT SECTION 
    .section .text
    .global main
    .type main,%function

.matrix:
    .word a
    .word b
    .word c

main:
    ldr r0 , .matrix
    ldr r2 , .matrix+8
接著執行迴圈，全圈用來控制卷積到第幾次(總共6次)。
inner的label部分則是實際執行3*3卷積，根據loop執行到的次數不同，起始卷積的位置也會不相同。
outer_loop:
    cmp r3 , #6
    add r3 , r3 , #1
    mov r4 , #0
    mov r11 , #0
    BNE inner
    B _exit

inner:
    ldr r1 , .matrix+4
    //r3從1到6
    cmp r3 , #1 
    addeq r12 , r0 , #0
    cmp r3 , #2
    addeq r12 , r0 , #4
    cmp r3 , #3
    addeq r12 , r0 , #8
    cmp r3 , #4
    addeq r12 , r0 , #20
    cmp r3 , #5
    addeq r12 , r0 , #24
    cmp r3 , #6
    addeq r12 , r0 , #28

    LDMIA r12 , {r5 , r6 , r7}
    LDMIA r1!, {r8 , r9 , r10}
    MUL r11 , r5 , r8
    MLA r11 , r6 , r9 , r11
    MLA r11 , r7 , r10 , r11

    add r12 , r12 , #20
    LDMIA r12 , {r5 , r6 , r7}
    LDMIA r1!, {r8 , r9 , r10}
    MLA r11 , r5 , r8 , r11
    MLA r11 , r6 , r9 , r11
    MLA r11 , r7 , r10 , r11

    add r12 , r12 , #20
    LDMIA r12 , {r5 , r6 , r7}
    LDMIA r1!, {r8 , r9 , r10}
    MLA r11 , r5 , r8 , r11
    MLA r11 , r6 , r9 , r11
    MLA r11 , r7 , r10 , r11

    STR r11 , [r2] , #4
    
    B outer_loop

_exit:
    nop
	
心得: 
	感覺這題應該要用4個迴圈來執行比較合理，不過因為因為卷積大小只有3*3不大可以一次做完，所以我減少迴圈使用的次數。