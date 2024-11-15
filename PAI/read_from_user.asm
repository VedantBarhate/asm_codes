global _start

section .data
	pr1 dw "Enter any value: "
	pr1_len equ $-pr1
	
	pr2 dw "Entered value is: "
	pr2_len equ $-pr2
	
section .bss
	val resb 2
	
section .text
	%macro print 2
		mov eax,4
		mov ebx,1
		mov ecx, %1
		mov edx, %2
		int 80h
	%endmacro

	%macro input 2
		mov eax, 3
		mov ebx, 0
		mov ecx, %1
		mov edx, %2
		int 80h
	%endmacro

_start:

	print pr1, pr1_len
	input val, 2
	print 10, 1
	print pr2, pr2_len
	print val, 2
	print 10, 1

	mov eax,1
	int 80h

