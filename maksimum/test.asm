GLOBAL main 
extern printf

section .data 
msg: db "The result =%s", 10, 0 

section .text
GLOBAL func 
extern printf

main:
	push ebp 
	mov ebp, esp  
	mov eax, 150
	mov edx, 0
	mov ecx, 3 

	div ecx
	mov cl, al
	mov al, 0 
	mov al, cl
	mov edx, 0 
	mov dl, al 
	dec dl
	mov dl, BYTE 'A'

	push edx
	push msg 
	call printf


	mov eax, 0 
	mov esp, ebp 
	pop ebp 
	ret
