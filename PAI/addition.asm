global _start

section .data
	sum dw 0
	nl db 10

section .text
_start:
	mov ax,7
	mov bx,2
	add ax,bx
	add ax,'0'
	mov [sum],ax
	
	mov eax,4
	mov ebx,1
	mov ecx,sum
	mov edx,2
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,nl
	mov edx,1
	int 80h
	
	mov eax,1
	int 80h
