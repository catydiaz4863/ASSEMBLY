include Irvine32.inc

.code
main proc
	
	call readInt
	mov edx, eax

	call readInt
	mov ebx, eax

	call readInt
	mov ecx, eax

	call readInt

	add edx, ebx
	sub edx, ecx
	add eax, edx
	
	call Crlf
	call WriteInt

	call Crlf

	invoke ExitProcess,0
main endp
end main