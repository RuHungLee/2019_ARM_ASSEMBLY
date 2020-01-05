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

    .type c,%object
c:
    .space 24, 0

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
    mov r3 , #0
    mov r4 , #0

outer_loop:
    cmp r3 , #6
    add r3 , r3 , #1
    mov r4 , #0
    mov r11 , #0
    BNE inner_loop
    B _exit

inner_loop:
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
    