; NASM Truth-machine
; Written in NASM Assembly
;
; Author: 	Pavel Novák
; Date: 	1-Nov-2020


%macro print 2				; Macro used for printing strings
	mov ecx, %1				; Set register ecx to arg1 - string to be printed
	mov edx, %2				; Set register edx to arg2 - lenght of string to be printed
	mov eax, 4				; Set register eax to 4 - sys_write
	mov ebx, 0				; Set register ebx to 0 - stdout
	int 0x80
%endmacro


SECTION .data
	msg db "Input number: "	; Define msg to be printed later
	msg_len equ $-msg		; Define lenght of msg
	num_len equ 1			; Define lenght of input
	NEW_LINE db 0xA			; Define newline character - '\n'

SECTION .bss
	num resb 1				; Reserve 1 byte for input

SECTION .text
	global _start

_start:
	print msg, msg_len		; Print msg

							; Getting number from user:
	mov eax, 3				; Move 3 to register eax - sys_read
	mov ebx, 0				; Set register to 0	
	mov ecx, num			; Set register ecx to reserved memory num
	mov	edx, num_len		; Set register edx to number of chars to recieve - num_len = 1
	int 0x80				; Call kernel

							; If:
	mov al, [num]			; Move memory contents of num to register al
	cmp al, '1'				; Compare register al to '1'
	je	_printOneLoop		; If al == '1' jump to _printOneLoop
							; Else:
	print num, num_len		; Print '0' 
	print NEW_LINE, 1		; Print '\n'
	
							; Exiting program
	mov eax, 1				; Move 1 to register eax - sys_exit
	mov ebx, 0				; Set exit code to 0 - no errors
	int 0x80				; Call kernel


_printOneLoop:				; Prints 1 infinietely.
	print num, num_len 		; Print '1'
	jmp _printOneLoop		; Repeat

