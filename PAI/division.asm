global _start

section .data
    quotient dw 0
    nl db 10

section .text
_start:
    mov ax,4          ; Set ax to 3
    mov bx,2          ; Set bx to 2
    div bx            ; Divide ax by bx, quotient in al (for 8-bit division)
    add al, '0'       ; Convert result to ASCII
    mov [quotient], al; Store result in quotient

    ; Print the quotient
    mov eax, 4
    mov ebx, 1
    mov ecx, quotient
    mov edx, 2
    int 80h

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 80h

    ; Exit
    mov eax, 1
    int 80h

