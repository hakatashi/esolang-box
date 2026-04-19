.section .text
.globl _start
_start:
	li a0, 1 # fd
	lui a1, %hi(msg)
	addi a1, a1, %lo(msg)
	li a2, 14 # count
	li a7, 64 # write
	ecall

	li a0, 0 # status
	li a7, 93 # exit
	ecall

.section .rodata
msg:
	.string "Hello, World!\n"
