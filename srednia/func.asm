;=====================================================================
; ARKO
;=====================================================================

section .text
global  func

func:
	
	push ebp
	mov	ebp, esp
	push ebx
	
	; przyklad zaladowania adresów obu argumentów do eax oraz ebx
	mov	eax, DWORD [ebp+8]	;input
	mov	ebx, DWORD [ebp+12]	;output
	mov edx, 0 
	mov ecx, 0 
	mov ch, 0 ; counter  
	mov dl, 9 ; min 

loop_mean: 
		
	mov cl, [eax]
	cmp cl, BYTE 32
	jle calc
	sub cl, BYTE '0' 
	add dh, cl   ; w dh suma 
	inc ch 		 ; w ch licznik, w dl minimum 
	cmp cl, dl
	jl min
	inc eax 
	jmp loop_mean
min: 
	mov dl, cl
	inc eax 
	jmp loop_mean
calc: 
	mov eax, 0
	mov ebx, 0 
	mov al, dh  ; suma w eax   
	mov bl, ch  ; dzielnik w ebx
	mov ch, dl  ; minimum w ch
	mov edx, 0 
	div ebx    	; wynik w eax
	mov cl, al	; srednia w cl
	
	add ch, BYTE '0' ; minimum 
	add cl, BYTE '0' ; srednia 
	mov eax, DWORD [ebp+8] 
	mov ebx, DWORD [ebp+12]

loop_replace: 

	mov dl, [eax]
	cmp dl, BYTE 32 
	jle epilog 
	cmp dl, cl 
	jl change

	mov [ebx], dl
	inc ebx
	inc eax 
	jmp loop_replace

change: 
	mov dl, ch 
	mov [ebx], dl 
	inc ebx 
	inc eax 
	jmp loop_replace


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
