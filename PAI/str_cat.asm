global _start

section .data
	string1 db "hello", 0; First string
	string2 db "world", 0; Second string
	
section .text	
_start:
	lea esi, [string1]
	lea edi, [string2]
	
	find_end:
		lodsb; Load byte at DS:SI into AL and increment SI
		cmp al, 0; Check if the byte is the null terminator
		je start_concat
		jmp find_end; Otherwise, keep searching
		
	start_concat:
		lea esi, [string2] ; Point SI to the start of the second string
		
	concat_loop:
		lodsb; Load byte at DS:SI into AL and increment SI
		stosb; Store byte in AL at ES:DI and increment DI
		cmp al, 0
		je done_concat
		jmp concat_loop ; Otherwise, keep copying
		
	done_concat:
		mov eax, 4
		mov ebx, 1
		mov ecx, string1
		mov edx, 16
		int 0x80
		
		mov eax, 1; sys_exit
		xor ebx, ebx; Status code 0
		int 0x80
