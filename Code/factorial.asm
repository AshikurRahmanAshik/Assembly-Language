INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
n DB ? 
fact DB ?
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'ENTER THE NUMBER: '
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,0
    JE SKIP
    MOV n,AL 
    
    FOR:
    DEC n
    CMP n,0
    JE ENDFOR
    MUL n
    JMP FOR
    
    
    SKIP:
    MOV AL,1
    JMP ENDFOR 
    
    ENDFOR:
    ADD AL,48
    
    
    
    
    
     
    PRINTN
    PRINT 'OUTPUT: '

    
    MOV AH,2
    MOV DL,AL
    INT 21H
   
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
    