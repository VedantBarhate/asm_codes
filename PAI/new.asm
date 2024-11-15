section .data
name db "Name- Soham Andhyal",10
len:equ $-name
roll db "Roll.No. 53",10
eln:equ $-roll
city db "Address- Maharashtra "
lne:equ $-city
section .text
global _start
%macro RW 4
mov eax,%1
mov ebx,%2
mov ecx,%3
mov edx,%4
int 80H
%endmacro
_start:
;Print Name
RW 4,1,name,len
;Print Roll. No
RW 4,1,roll,eln
;Print address
RW 4,1,city,lne
;Exit
RW 1,0,0,0
