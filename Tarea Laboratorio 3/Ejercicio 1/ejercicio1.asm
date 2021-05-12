    org     100h
    section .text

    xor AX,AX
    mov CX,8d

    mov  byte[200h],0d
    mov  byte[200h],0d
    mov  byte[200h],1d
    mov  byte[200h],1d
    mov  byte[200h],0d
    mov  byte[200h],4d
    mov  byte[200h],1d
    mov  byte[200h],8d

    mov BX, 200h
    jmp fun
fun:
    add     AL,[BX]
    add     BX,1h
    loop    fun

    mov     CL, 8d
    div     CL
    mov byte[20Ah],AL
    int 20h
    
