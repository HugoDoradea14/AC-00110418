;Hugo Enrique Doradea - 00110418
	org 	100h

	section	.text

	mov 	DX, inicio
	call  	EscribirCadena
	mov 	BP, entrada
	call  	LeerCadena
    call    Verificar
	call	EsperarTecla
	int 	20h

	section	.data

inicio	db	"PASSWORD: ", "$"
correcto 	db 	"BIENVENIDO ", "$"
incorrecto 	db 	"INCORRECTO ", "$"
passw   db  "12345" ,"$"
entrada 	times 	20  	db	" " 	


EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

Verificar:
    
	mov 	CL,[entrada + SI]   
	mov 	BL,[passw + SI]    
	INC     SI             	  
	CMP     CL,BL          	  
	JE      truetrue  	  
	JNP     false    	  
    
true:
    CMP     BL,CL  
    JE      true  	  
	JNP     false 

truetrue:
    mov 	DX, correcto
	call 	EscribirCadena
    jmp	exit   
    

false:
	mov 	DX, incorrecto
	call 	EscribirCadena
    jmp	exit


LeerCadena:
        xor     SI, SI         

while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        
        je      exit            
        mov     [BP+SI], AL   
        inc     SI            
        jmp     while         
exit:
	mov 	byte [BP+SI], "$"
        ret

EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret