INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
str DB 80 DUP ?
n DB ?
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,0
    PRINT 'ENTER INPUT :'
    MOV AH,1
    INPUT:
    INT 21H
    CMP AL,0DH
    JE ENDINPUT
    MOV str[SI],AL
    INC SI
    JMP INPUT
    
    
    ENDINPUT:
    DEC SI
     
    PRINTN
    PRINT 'OUTPUT: '

    
    MOV AH,2
    OUTPUT:
    MOV DL,str[SI]
    INT 21H
    DEC SI 
    CMP SI,0
    JL ENDOUTPUT
    JMP OUTPUT
    
    ENDOUTPUT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
    