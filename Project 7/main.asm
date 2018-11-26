; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	.data
	;Exercise 1 Prompts
	promptSentence BYTE "Please enter a sentence: ",0dh,0ah,0
    promptChars BYTE "Please enter the number of characters to delete (in hexadecimal): ", 0dh, 0ah, 0
    promptPos BYTE "Please enter the position from where to start deleting (in hexadecimal): ", 0dh, 0ah, 0
    ;Exercise 2 prompts
    promptS1 BYTE "Please enter a Sentence, S1, to insert: ", 0dh, 0ah, 0
    promptS2 BYTE "Please enter a Sentence, S2, in which to insert S1 into: ", 0dh, 0ah, 0
    promptPos2 BYTE "Please enter the position P where to insert: ", 0dh, 0ah, 0
    ;Buffers for string storage
    buffer1 BYTE 256 DUP(?) 
    buffer2 BYTE 256 DUP(?) 
    finalString BYTE 512 DUP(?) ;Buffer for final string for exercise 2
    ;new line
    newLine BYTE " ", 0dh, 0ah, 0
	;end of line
	endLine BYTE 0
	.code

main proc
	;Exercise 1
    call delete
    ;Exercise 2
	call insert
	invoke ExitProcess,0
main endp

delete proc ;Exercise 1
	;Save registers
	push edx 
	push ecx 
	push eax 
	push edi
	push esi 
	push ebx 

    ;get information from user
	;prompt for sentence
	mov edx, OFFSET promptSentence
	call WriteString
	;receive sentence
	mov edx, OFFSET buffer1 ;point to buffer
	mov ecx, 256 ;max characters
	call ReadString ;get sentence
    ;prompt for characters to delete
	mov edx, OFFSET promptChars
	call WriteString
	;receive number of characters to delete
	call ReadHex ;stores hex # in EAX
	mov ebx, eax ;Store # of characters to delete
	;Prompt for position
	mov edx, OFFSET promptPos
	call WriteString
	;receive position
	call ReadHex ;store hex # in EAX starting at 0
	add ebx, eax ;Add Pos + # of deleted characters, will help efficiently edit string

    ;Edit string
	cld ;clear so movsb moves forward
	mov esi, OFFSET buffer1 
	mov edi, OFFSET buffer1 
	add edi, eax ;move destination to entered position
	add esi, ebx ;Increment source to position + # of deleted characters.
	mov ecx, 256
	sub ecx, ebx ;Will have to movsb The lenght of the string - (Pos + # of deleted char) times
	rep movsb ;shift characters

    ;Display string
	mov edx, OFFSET buffer1
	call WriteString
	mov edx, OFFSET newLine ;make new line
	call WriteString
	mov edx, OFFSET endLine ;end finalString
	call WriteString

    ;Restore registers and return to calling procedure
	pop ebx
	pop esi
	pop edi
	pop eax
	pop ecx
	pop edx
	ret
delete endp

insert proc ;Exercise 2
	;Save registers
	push edx
	push ecx
	push eax
	push esi
	push edi
	push ebx

	;get information from user
    ;prompt for s1
	mov edx, OFFSET promptS1
	call WriteString
	;receive s1
	mov edx, OFFSET buffer1 ;point to buffer
	mov ecx, 256 ;max character
	call ReadString ;get s1
	mov ebx, eax ;move size of s1 into ebx to save it
	;Prompt for s2
	mov edx, OFFSET promptS2
	call WriteString
    ;receive S2
	mov edx, OFFSET buffer2 ;point to buffer
	mov ecx, 256 ;max characters
	call ReadString ;get sentence
	push eax ;save eax (number of char in s2)
	;Prompt for position
	mov edx, OFFSET promptPos2
	call WriteString
	;Receive position
	call readHex ;store position in EAX starting at 0

    ;Insert S1 into S2 starting at P
	cld ;clear so move forwards
	mov esi, OFFSET buffer2 ;Source starts at S2
	mov edi, OFFSET finalString ;destination is finalString
	mov ecx, eax ;put position into ecx to use as counter
	rep movsb ;mov characters from S2 into final string, until at position.
	mov esi, OFFSET buffer1
	mov ecx, ebx ;make counter size of S1
	rep movsb ;will insert all of S1 into final string
	mov esi, OFFSET buffer2 ;move back to s2
	add esi, eax ;move to position in S2 that we left off at.
	mov ebx, eax ;move position so we can subtract it from the original S2 length
	pop eax ;pop original S2 length
	sub eax, ebx ;subtract position from original S2 length
	mov ecx, eax ;put # of characters left to move into counter
	rep movsb ;move rest of S2 into final string

    ;Display new string
	mov edx, OFFSET finalString
	call WriteString
	mov edx, OFFSET newLine ;make new line
	call WriteString
	mov edx, OFFSET endLine ;end finalString
	call WriteString

    ;Restore registers and return to calling function
	pop ebx
	pop edi
	pop esi
	pop eax
	pop ecx
	pop edx
	ret
insert endp
end main