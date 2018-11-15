include Irvine32.inc

.data
myArray DWORD  10 DUP(?)

.code
main proc
	
	mov ecx,10
	mov ebx, 0
	L1:

	call readInt
	mov [myArray + ebx], eax
	add ebx, 4

	loop L1
	
	call crlf

	mov ecx, 10
	mov ebx, 0
	L2:

	mov eax, [myArray + ebx]
	add ebx, 4
	call WriteInt

	call crlf
	loop L2



	invoke ExitProcess,0
main endp
end main