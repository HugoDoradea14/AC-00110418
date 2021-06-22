org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor

    call modotexto

    ITERAR:
        call movercursor 
        MOV CL, [cadena01+SI] 
        call escribirletra
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 4d 
        JB ITERAR 
        INC DH
        INC DH
        MOV SI, 0
        MOV DI, 0d
        MOV DL, 20 
        jmp ITERAR02 
    
    ITERAR02:
    
        call movercursor 
        MOV CL, [cadena02+SI] 
        call escribirletra
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 7d 
        JB ITERAR02 
        INC DH
        INC DH
        MOV SI, 0
        MOV DI, 0d
        MOV DL, 20 
        jmp ITERAR03 

    ITERAR03:    
        call movercursor 
        MOV CL, [cadena03+SI] 
        call escribirletra
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 7d 
        JB ITERAR03
        INC DH
        INC DH
        MOV SI, 0
        MOV DI, 0d
        MOV DL, 20 
        jmp ITERAR04 

    ITERAR04:    
        call movercursor 
        MOV CL, [cadena04+SI] 
        call escribirletra
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 7d 
        JB ITERAR04 
        call movercursor
        jmp esperartecla 

    modotexto: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET

    movercursor:
        MOV AH, 02h  
        MOV BH, 0h 
        INT 10h
        RET

    escribirletra:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h



    section .data

    cadena01 DB 'Hugo'
    cadena02 DB 'Enrique'
    cadena03 DB 'Doradea'
    cadena04 DB 'Herrera'
    
; - 00110418