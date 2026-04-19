.section .bss
	.comm buf, 1

.section .text
.globl _start
_start:
	li a0, 0 # fd
	lui a1, %hi(buf)
	addi a1, a1, %lo(buf)
	li a2, 1 # count
	li a7, 63 # read
	ecall

	beqz a0, end

	li a0, 1 # fd
	lui a1, %hi(buf)
	addi a1, a1, %lo(buf)
	li a2, 1 # count
	li a7, 64 # write
	ecall

	j _start

end:
	li a0, 0 # status
	li a7, 93 # exit
	ecall
