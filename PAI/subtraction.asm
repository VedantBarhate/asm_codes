global _start

section .data
	diff : dw 0
	newline : db 10

section .text
_start:
	mov ax,7
	mov bx,2
	sub ax,bx
	add ax,'0'
	mov [diff],ax
	mov eax,4
	mov ebx,1
	mov ecx,diff
	mov edx,2
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,2
	int 80h
	
	mov eax,1
	int 80h
