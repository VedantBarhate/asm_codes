global _start

section .data
    product dw 0
    nl db 10

section .text
_start:
    mov ax,3          ; Set ax to 7
    mov bx,2          ; Set bx to 2
    mul bx            ; Multiply ax by bx (ax * bx), result in ax
    add ax, '0'       ; Convert result to ASCII
    mov [product], ax ; Store result in product

    ; Print the product
    mov eax, 4
    mov ebx, 1
    mov ecx, product
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

