global _start

section .data
	name db "vedant barhate",10
	n_len equ $-name
	clg db "MIT-SOC",10
	clg_len equ $-name
	
section .text
_start:
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,n_len
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,clg
	mov edx,clg_len
	int 80h
	
	mov eax,1
	int 80h
	
