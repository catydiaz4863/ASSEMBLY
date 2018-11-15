include Irvine32.inc
.data
ranNum DWORD ?
lowv BYTE "too low", 0
highv BYTE "too high", 0
guess DWORD ?
intro BYTE "Welcome to the guessing game!", 0
game BYTE "Please enter a number: ", 0
win BYTE "Good job! it took you: ", 0
tries DWORD 0
total BYTE " Tries: ", 0




.code
main proc

; random number 1 -100
		call Randomize
       mov  eax,100     ;get random 0 to 99
       call RandomRange ;
       inc  eax         ;make range 1 to 100
       mov  ranNum,eax  ;save random number

; Do greetings
mov edx, OFFSET intro
call writeString
call crlf

START:
	mov edx, OFFSET game
	call writeString

	call readInt
	mov guess, eax

	mov ebx, ranNum

	cmp guess, ebx

       je  WON    ;jump if string1 = string2
       jg  TOOHIGH  ;jump if string1 > string2
       jl TOOLOW ;jump if string1 < string2


TOOLOW:

	inc tries
	mov edx, OFFSET lowv
	call writeString
	call crlf

	jmp START


TOOHIGH:

	inc tries
	mov edx, OFFSET highv
	call writeString
	call crlf

	jmp START

WON:

	inc tries
	mov edx, OFFSET win
	call writeString
	call crlf

	mov edx, OFFSET total
	call writeString
	mov eax, tries
	call writeInt
	call crlf


	invoke ExitProcess,0
main endp
end main