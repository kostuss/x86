section .text 
global func 

func: 
	push ebp 
	mov ebp, esp 
	push ebx 

	mov eax, DWORD [ebp+12] ; input 
	mov ebx, DWORD [ebp+8] ; output 
	mov bl, BYTE 'a'
	mov dl, BYTE '0'


loop1: 
	cmp BYTE [eax], 32
	jle save
	cmp [eax], bl 
	jne next
	add dl, 1 

next:
	inc eax 
	jmp loop1


save: 
	cmp dl, BYTE '0'
	je next1
	mov [ebx], bl 
	inc ebx 
	mov [ebx], dl
	inc ebx

next1: 
	mov eax, DWORD [ebp+12]
	mov dl, BYTE '0'
	add bl, 1
	cmp bl, BYTE 'z'
	jle loop1

epilog: 
	pop ebx
	mov esp, ebp
	pop	ebp
	ret