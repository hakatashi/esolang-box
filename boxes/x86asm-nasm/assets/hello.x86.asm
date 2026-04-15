SECTION .data
	hello: db 'Hello, World!'

SECTION .text
	global main

main:
	mov edx, 13
	mov ecx, hello
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80
