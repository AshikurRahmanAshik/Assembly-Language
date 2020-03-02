INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
x DB DUP 80 ?
N DB ?
 
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV SI,0
    XOR CX,CX
    
    PRINT 'ENTER THE NUMBER :'
    MOV AH,1
    FOR:
    INT 21H
    CMP AL,0DH
    JE ENDFOR
    MOV x[SI],AL
    INC SI
    INC CX
    JMP FOR
    
    ENDFOR:
    
    LOOP1:
    DEC SI
    MOV DI,SI
    LOOP2: 
    DEC DI
    MOV BL,x[SI]
    CMP BL,x[DI]
    JG SKIP
    XCHG BL,x[DI]
    MOV x[SI],BL
    SKIP:
    CMP DI,0
    JNE LOOP2
    ENDLOOP2:
    CMP SI,1
    JG LOOP1
    ENDLOOP1:
    

    
    PRINTN
    MOV SI,0
    PRINT 'OUTPUT:'
    MOV AH,2
    OUTPUT:
    MOV DL,x[SI]
    INT 21H
    INC SI
    CMP SI,CX
    JNE OUTPUT
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
    