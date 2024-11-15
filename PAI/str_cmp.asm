global _start


section .data
	string1 db "Hello", 0 ; First string
	string2 db "Hello", 0 ; Second string
	dif db "different", 10
	eql db "equal", 10


section .text
_start:
	lea esi, [string1] ; Point SI to the start of the first string
	lea edi, [string2] ; Point DI to the start of the second string
	
	compare_loop:
		lodsb; Load byte at DS:SI into AL and increment SI
		scasb; Compare byte in AL with byte at ES:DI
		jne strings_different ; Jump if not equal
		cmp al, 0
		; Check if we reached the end of both strings
		je strings_equal ; If equal, the strings are equal
		jmp compare_loop ; Otherwise, continue comparing
	
	strings_different:
		mov eax, 4
		mov ebx, 1
		mov ecx, dif
		mov edx, 10
		int 0x80
		
		mov eax, 1
		mov ebx, 1
		int 0x80
	
	strings_equal:
		mov eax, 4
		mov ebx, 1
		mov ecx, eql
		mov edx, 5
		int 0x80
		
		mov eax, 1
		xor ebx, ebx
		int 0x80
		
	mov eax, 1; sys_exit
	xor ebx, ebx; Status code 0 (equal)
	int 0x80; Invoke system call	
