global _start

section .data
	pr1 dw "Enter 1st value: "
	pr1_len equ $-pr1
	pr2 dw "Enter 2nd value: "
	pr2_len equ $-pr2
	
	pr3 dw "Addition is: "
	pr3_len equ $-pr3
	
	nl db 10
	
section .bss
	val1 resw 2
	val2 resw 2
	res resw 2

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
	; val1 input
	print pr1, pr1_len
	input val1, 2
	mov eax, [val1]
	sub eax, '0'
	mov [val1], eax
	
	; val2 input
	print pr2, pr2_len
	input val2, 2
	mov eax, [val2]
	sub eax, '0'
	mov [val2], eax
	
	; adding val2  val2
	mov eax, [val1]
	add eax, [val2]
	add eax, '0'
	mov [res], eax
	
	; displaying sum
	print pr3, pr3_len
	print res, 2
	print nl, 1

	mov eax,1
	int 80h

