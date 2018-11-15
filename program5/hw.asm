include Irvine32.inc
.data
welcome BYTE "Welcome to my game! It is so cool.", 0
think BYTE "Think of a number between 1 and 100", 0

guess DWORD ?
lowest DWORD 1
highest DWORD 100

tries DWORD 0
guessIs BYTE "My guess is: ", 0
response BYTE 10 DUP(0)
directions BYTE "(yes) or no (too high / too low): ", 0
success BYTE "YAYYYY. I did it!", 0
yesStr BYTE "yes", 0
tooHighStr BYTE "too high", 0
tooLowStr BYTE "too low",0

triesStr BYTE "It only took ", 0
triesStr2 BYTE " tries.", 0

.code
main proc
	
	mov edx, OFFSET welcome
	call WriteString
	call Crlf

	mov edx, OFFSET think
	call WriteString
	call Crlf

	;initial guess
	mov guess, 50

TELLGUESS:
	inc tries
	mov edx, OFFSET guessIs
	call WriteString

	mov eax, guess
	call WriteInt
	call Crlf

	mov edx, OFFSET directions
	call WriteString
	
	mov edx, OFFSET response
	mov ecx, 9
	call ReadString

	INVOKE Str_compare, ADDR response, ADDR yesStr
	je YES

	INVOKE Str_compare, ADDR response, ADDR tooLowStr
	je TOOLOW

	INVOKE Str_compare, ADDR response, ADDR tooHighStr
	je TOOHIGH

TOOLOW:
	;adjust range
	mov eax, guess
	mov lowest, eax

	mov ebx, 2
	mov eax, lowest
	add eax, highest
	xor edx, edx
	div ebx


	;pick something inside the range
	mov guess, eax

	jmp TELLGUESS

TOOHIGH:
	;adjust range
	mov eax, guess
	mov highest, eax
	
	mov ebx, 2

	mov eax, highest
	add eax, lowest

	xor edx, edx
	div ebx

	;pick something inside the range
	mov guess, eax

	jmp TELLGUESS

YES:
	mov edx, OFFSET success
	call WriteString

	call Crlf

	mov edx, OFFSET triesStr
	call WriteString

	mov eax, tries
	call WriteInt

	mov edx, OFFSET triesStr2
	call WriteString

	call Crlf
	invoke ExitProcess,0
main endp
end main