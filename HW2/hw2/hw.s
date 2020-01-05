/* ========================== */
/*        TEXT section        */
/* ========================== */
	.section .text
	.global main
	.type main, %function
main: 
	ldr r1,=#10
	ldr r2,=#20
	ldr r3,=#15
	ldr r4,=#12
	mul r5 , r1 , r2
	mul r6 , r3 , r4
	ADD r0 , r5 , r6
	nop
	.end
