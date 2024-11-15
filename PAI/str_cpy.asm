section .data
    source db 'Hello, world!',0  ; Source string with null terminator
    destination db 20 dup(0)      ; Destination string (20 bytes, initialized to zero)

section .bss
    ; No BSS section required for this example

section .text
    global _start

_start:
    ; Copy the string from source to destination
    mov esi, source      ; Load the address of source string into esi
    mov edi, destination ; Load the address of destination string into edi
copy_loop:
    lodsb                ; Load byte from [esi] into al and increment esi
    stosb                ; Store byte from al into [edi] and increment edi
    test al, al          ; Check if al (byte) is 0 (end of string)
    jnz copy_loop        ; If not zero, repeat the loop

    ; Now, print the copied string
    mov eax, 4           ; Syscall number for sys_write
    mov ebx, 1           ; File descriptor 1 (stdout)
    mov ecx, destination ; Pointer to the destination string
    mov edx, 13          ; Length of the string to print (13 characters)
    int 0x80             ; Make syscall

    ; Exit program
    mov eax, 1           ; Syscall number for sys_exit
    xor ebx, ebx         ; Exit code 0
    int 0x80             ; Make syscall

