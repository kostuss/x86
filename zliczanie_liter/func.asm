section .text 
global func 

func: 
	push ebp 
	mov ebp, esp 
	push ebx 

	mov eax, DWORD [ebp+12] ; output
	mov ebx, DWORD [ebp+8] ; input
	mov cl, BYTE 'a'
	mov dl, BYTE '0'


loop1: 
	cmp BYTE [ebx], 32
	jle save
	cmp [ebx], cl 
	jne next
	inc dl 

next:
	inc ebx 
	jmp loop1


save: 
	cmp dl, BYTE '0'
	je next1
	mov [eax], cl 
	inc eax 
	mov [eax], dl
	inc eax

next1: 
	mov ebx, DWORD [ebp+8]
	mov dl, BYTE '0'
	add cl, 1
	cmp cl, BYTE 'z'
	jle loop1

epilog: 
	pop ebx
	mov esp, ebp
	pop	ebp
	ret