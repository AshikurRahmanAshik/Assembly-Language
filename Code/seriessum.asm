INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
n DB ? 
divisor DB ?
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV divisor,2
    PRINT 'ENTER THE MUNER : '
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV n,AL
    ADD AL,1
    MUL n
    DIV divisor
    
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
    