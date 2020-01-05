/* ========================= */
/*       DATA section        */
/* ========================= */
	.data @ data section <- not read only
	.align 4 @location is divisable by 4
@===============================
	.type a, %object 
	.size a, 80 @記憶體大小 80bytes
a:
	.word 1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2 
@===============================
	.type b, %object
	.size b, 80 @記憶體大小 80bytes
b:
	.word 5,5,5,5,5,5,5,5,5,5,3,3,3,3,3,3,3,3,3,3
@===============================
c:
	.space 80 , 0 @記憶體大小 80bytes，並且全部位元設為0
/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text @text section <- read only
	.global main
	.type main,%function

.matrix:
	.word a @藉由linker，存取data section中的a記憶體位置
	.word b @藉由linker，存取data section中的b記憶體位置
	.word c @藉由linker，存取data section中的c記憶體位置

main:
	ldr r0 , .matrix @ r0 load進a的記憶體位置
	ldr r2 , .matrix+4 @ r2 load進b的記憶體位置
	ldr r6 , .matrix+8 @ r6 load進c的記憶體位置
	ldr r1 , .matrix+8 @ r2 load進c的記憶體位置
	mov r8 , #20 @ r8 = #20
check:
	cmp r8 , #0 @r8和0進行比較(CPSR紀錄)
	BNE loop @如果r8不等於0，進入loop label(linker?)
	B _exit @否則跳至 _exit label(linker?)
loop:
	ldr r3 , [r0] , #4 @從r0存的記憶體位置中讀值存進r3，並且r0 := r0+4，位置及a的第二個word
	ldr r4 , [r2] , #4 @從r2存的記憶體位置中讀值存進r4，並且r2 := r2+4，位置及b的第二個word
	add r5 , r3 , r4 
	str r5 ,[r6] , #4 @將r5存進r6存取的記憶體位置內
	sub r8 , r8 , #1 @ r8--
	b check @跳回check
_exit:
	nop
