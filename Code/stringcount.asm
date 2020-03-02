INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
VL DB 0
CN DB 0
NUM DB 0
SPA DB 0
OTH DB 0
str DB DUP 80 ?
 
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
     
    MOV VL,0
    MOV CN,0
    MOV NUM,0
    MOV SPA,0
    MOV OTH,0
    
    PRINT 'ENTER THE STRING : '
    MOV AH,1
    INPUT:
    INT 21H
    CMP AL,0DH
    JE ENDINPUT
    
    CMP AL,'A'
    JL OTHER
    CMP AL,'z'
    JG OTHER
    JMP CHAR 
    
    CHAR:
    CMP AL,'A'
    JE VOWEL 
    
    CMP AL,'E'
    JE VOWEL
    
    CMP AL,'I'
    JE VOWEL
    
    CMP AL,'O'
    JE VOWEL
    
    CMP AL,'U'
    JE VOWEL
    
    CMP AL,'a'
    JE VOWEL
    
    CMP AL,'e'
    JE VOWEL
    
    CMP AL,'i'
    JE VOWEL
    
    CMP AL,'o'
    JE VOWEL
    
    CMP AL,'u'
    JE VOWEL 
    JMP CONS
    
   
    
    VOWEL:
    INC VL
    JMP INPUT
    
    CONS:
    INC CN
    JMP INPUT 
    
    OTHER: 
    CMP AL,' '
    JNE OTHER2
    INC SPA 
    JMP INPUT
    
    OTHER2:
    CMP AL,'0'
    JL OTHER3
    CMP AL,'9'
    JG OTHER3
    INC NUM
    JMP INPUT
    
    OTHER3:
    INC OTH
    JMP INPUT
      

    
    ENDINPUT: 
     
    PRINTN
    MOV AH,2
    PRINT 'VOWEL: '
    ADD VL,48
    MOV DL,VL
    INT 21H  
    
    PRINTN 
    MOV AH,2
    PRINT 'CONSONANT: '
    ADD CN,48
    MOV DL,CN
    INT 21H
    
    PRINTN 
    MOV AH,2    
    PRINT 'NUMBER: '
    ADD NUM,48
    MOV DL,NUM
    INT 21H
    
    PRINTN 
    MOV AH,2
    PRINT 'SPACE: '
    ADD SPA,48
    MOV DL,SPA
    INT 21H
    
    PRINTN 
    MOV AH,2
    PRINT 'OTHERS: '
    ADD OTH,48
    MOV DL,OTH
    INT 21H
    
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
    