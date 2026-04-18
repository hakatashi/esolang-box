SECTION .bss
	buf resb 1

SECTION .text
	global main

main:
start:
	mov edx, 1
	mov ecx, buf
	mov ebx, 0
	mov eax, 3
	int 0x80

	cmp eax, 0
	jle end

	mov edx, eax
	mov ecx, buf
	mov ebx, 1
	mov eax, 4
	int 0x80

	jmp start

end:
	mov eax, 1
	mov ebx, 0
	int 0x80
