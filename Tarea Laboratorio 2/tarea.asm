        org 	100h

		section	.text


;En 200h el carácter R
;En 201h el carácter A
;En 202h el carácter G
;En 203h el carácter Q

        mov	byte [200h], "H"
		mov	byte [201h], "E"
		mov	byte [202h], "D"
        mov	byte [203h], "H"

;Luego, mover a los siguientes registros los códigos ASCII de los caracteres guardados en 200h (75%):

;Copiar el valor de 200h a AX usando direccionamiento directo.
        mov AX, [200h]
;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
        mov BL, [201h]
        mov	CX, [BX]

;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
	    mov BX, 200h
        mov SI, 002h
	    mov	DX, [BX +SI ]
;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
        MOV DI, [BX +003h]
        


        int 20h