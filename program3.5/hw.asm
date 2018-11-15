include Irvine32.inc

.data

star BYTE "*", 0

.code
main proc

	call ReadInt
	mov ecx, eax

	L1:
		
		mov ebx, ecx

		L2:

		mov edx, OFFSET star
		call WriteString

		loop L2

		mov ecx, ebx
		call crlf

	loop L1

	invoke ExitProcess,0
main endp
end main