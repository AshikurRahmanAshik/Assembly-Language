INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
str DB 80 DUP ?
n DB ?
.CODE

MAIN PROC
    
    
    MOV n,0
    MOV SI,100
    
    PRINT 'ENTER THE STRING :'
    
    MOV AH,1
    INPUT:
    INT 21H
    CMP AL,0DH
    JE ENDINPUT 
    
    IF:
    CMP AL,65
    JL ELSEIF
    CMP AL,90
    JG ELSEIF
    ADD AL,32  
    JMP ELSE
    
    ELSEIF:
    CMP AL,97
    JL ELSE
    CMP AL,122 
    JG ELSE
    SUB AL,32
    
    ELSE:
    MOV str[SI],AL
    INC SI
    INC n
    JMP INPUT
    
   
    
    
    ENDINPUT: 
    PRINTN
    PRINT 'OUTPUT: '
    
    MOV SI,100 
    
    
    MOV AH,2
    OUTPUT:
    MOV DL,str[SI]
    INT 21H
    DEC n 
    INC SI
    CMP n,0
    JE ENDOUTPUT
    JMP OUTPUT
    
    ENDOUTPUT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
    