1. CODE分成兩個section，一個是data section，一個是text section。兩者其實並不只是為了可讀性
做區分。text section是唯獨，也就是不管從程式中load進幾次，都不會有所修改，也就是說os只要
讀一次即可(大部分os只會load一次)。data section不是唯獨，在程式執行中會不斷的改變，這也代
表者他必須隨時的做複製更新。


2. DATA section

這個部分是分配所需要用到的記憶體和其值，還有位置的一些配置資訊。我把細節註解在程式碼後面。

//===========================================================
.type a, %object -> 指定a型態為object，其他常用型態還有function。

	.size a, 80 -> 記憶體大小 80bytes(4bytes*20)
a:
	.word 1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2 -> 每個word為4bytes，這裡宣告5*4個。
//===========================================================

3. TEXT section 

這個部分執行了4*5矩陣的相加。我把細節註解在程式碼後面。

//============================================================

	.section .text @text section
	.global main
	.type main,%function

.matrix:
	.word a ->藉由linker，存取data section中的a記憶體位置
	.word b ->藉由linker，存取data section中的b記憶體位置
	.word c ->藉由linker，存取data section中的c記憶體位置

main:
	ldr r0 , .matrix -> r0 load進a的記憶體位置
	ldr r2 , .matrix+4 -> r2 load進b的記憶體位置
	ldr r6 , .matrix+8 -> r6 load進c的記憶體位置
	ldr r1 , .matrix+8 -> r2 load進c的記憶體位置
	mov r8 , #20 -> r8 = #20
check:
	cmp r8 , #0 -> r8和0進行比較(CPSR紀錄)
	BNE loop -> 如果r8不等於0，進入loop label(linker?)
	B _exit -> 否則跳至 _exit label(linker?)
loop:
	ldr r3 , [r0] , #4 -> 從r0存的記憶體位置中讀值存進r3，並且r0 := r0+4，位置及a的第二個word
	ldr r4 , [r2] , #4 -> 從r2存的記憶體位置中讀值存進r4，並且r2 := r2+4，位置及b的第二個word
	add r5 , r3 , r4 
	str r5 ,[r6] , #4 -> 將r5存進r6存取的記憶體位置內
	sub r8 , r8 , #1 -> r8--
	b check -> 跳回check

//============================================================