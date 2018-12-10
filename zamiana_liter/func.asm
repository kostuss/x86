;=====================================================================
; ARKO - program przykladowy zamieniajacy male litery na duze a duze na male
;=====================================================================

section .text
global  func

func:
	
	push ebp
	mov	ebp, esp
	push ebx
	
	; przyklad zaladowania adresów obu argumentów do eax oraz ebx
	mov	eax, DWORD [ebp+8]	;adres *b do eax
	mov	ebx, DWORD [ebp+12]	;adres *a do ecx
	
loop: 

	mov dl, [ebx] 
	cmp BYTE dl, 31
	jl epilog
	
	cmp BYTE dl, 64
	jle zapis
	cmp BYTE dl, 90
	jle duza 
	cmp BYTE dl, 96
	jle zapis 

mala: 
	sub dl, BYTE 32
	jmp zapis 

duza: 
	add dl,  BYTE 32
	jmp zapis 
zapis:
	mov [eax] , dl 
	inc ebx 
	inc eax
	jmp loop	

epilog:
	pop ebx
	mov esp, ebp
	pop	ebp
	ret

;============================================
; STOS
;============================================
;
; wieksze adresy
; 
;  |                             |
;  | ...                         |
;  -------------------------------
;  | parametr funkcji - char *a  | EBP+8
;  -------------------------------
;  | adres powrotu               | EBP+4
;  -------------------------------
;  | zachowane ebp               | EBP, ESP
;  -------------------------------
;  | ... tu ew. zmienne lokalne  | EBP-x
;  |                             |
;
; \/                         \/
; \/ w ta strone rosnie stos \/
; \/                         \/
;
; mniejsze adresy
;
;
;============================================
