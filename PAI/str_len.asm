global _start

section .data
	string1 db "Hello", 0
	len db 0
	nl db 10, 0

_start:
	lea esi, [string1]
	xor cx, cx ; Clear CX to use it as a counter
	length_loop:
		lodsb;
		cmp al, 0;
		je done_length
		inc cx
		jmp length_loop
		
	done_length:
		mov eax, ecx
		add eax, '0'
		mov [len], eax
		
		mov eax, 4
		mov ebx, 1
		mov ecx, len
		mov edx, 1
		int 0x80
		
		mov eax, 4
		mov ebx, 1
		mov ecx, nl
		mov edx, 1
		int 0x80

		
	mov eax, 1;
	xor ebx, ebx;
	int 0x80;
	
	
