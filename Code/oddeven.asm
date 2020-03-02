INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
divisor DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV divisor,2
    PRINT 'ENTER THE NUMBER '
    MOV AH,1
    INT 21H
    SUB AL,48
    
    DIV divisor
    
    CMP AH,0
    JE EVEN
    JMP ODD
    
    
    EVEN: 
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    PRINT 'EVEN'
    JMP EXIT
    
    ODD:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    PRINT 'ODD'
    
    EXIT:  
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN