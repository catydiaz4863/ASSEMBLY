include Irvine32.inc

.code
main proc
	
	call ReadInt
	mov ebx, eax

	call ReadInt
	mov ecx, eax

	call ReadInt
	mov edx, eax

	call ReadInt

	
	add eax, ebx
	add eax, ecx
	add eax, edx

	call WriteInt

	invoke ExitProcess,0
main endp
end main