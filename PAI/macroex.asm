global _start

section .data
	name db "vedant",10
	name_len equ $-name
	
	clg db "MIT-ADT",10
	clg_len equ $-clg
	
	branch db "CSE",10
	branch_len equ $-branch
	
	loc db "Pune",10
	loc_len equ $-loc
	
	
section .text
	%macro print 2
		mov eax,4
		mov ebx,1
		mov ecx, %1
		mov edx, %2
		int 80h
	%endmacro


_start:
	print name, name_len
	print clg, clg_len
	print branch, branch_len
	print loc, loc_len	


	mov eax,1
	int 80h

