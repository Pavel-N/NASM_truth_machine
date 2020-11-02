; NASM Truth-machine
; Written in NASM Assembly
;
; Author: 	Pavel Novák
; Date: 	1-Nov-2020


%macro print 2
	mov ecx, %1
	mov edx, %2
	mov eax, 4
	mov ebx, 0
	int 0x80
%endmacro


SECTION .data	; Initialized data
	msg db "Input number: "
	msg_len equ $-msg
	num_len equ 1
	NEW_LINE db 0xA

SECTION .bss	; Uninitialized data
	num resb 1

SECTION .text	; Code
	global _start

_start:
	; Print msg
	print msg, msg_len	

	; Get num
	mov eax, 3
	mov ebx, 0
	mov ecx, num
	mov	edx, num_len
	int 0x80

	; If num == 1 jump to _oneLoop
	mov al, [num]
	cmp al, '1'
	je	_printOneLoop
	; Else
	print num, num_len		; Print '0' once
	print NEW_LINE, 1		; Print '\n'
	
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

; Print '1'
_printOneLoop:
	print num, num_len 		; Print '1'
	jmp _printOneLoop

