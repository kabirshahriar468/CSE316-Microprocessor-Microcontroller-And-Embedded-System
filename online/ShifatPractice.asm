.MODEL SMALL
.STACK 100H
.DATA
     ARR DB 100 DUP(?)

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,OFFSET ARR
    ;LEA SI,ARR
    MOV CX,0
     
    INPUT:
    
    MOV AH,1
    INT 21H
    CMP AL,13
    JE ENDA
    INC CX
    MOV [SI],AL 
    
    INC SI
    JMP INPUT
   
   ;MOV SI,OFFSET ARR 
   ;LEA SI,ARR
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
   ENDA: 
   mov ah,2
    
    mov dl,13
    int 21h 
    mov ah,2
    
    mov dl,10
    int 21h    
   
   MOV SI,OFFSET ARR   
   JMP ENDR
   ENDR: 
    MOV AH,2
    MOV DL,[SI]
    INT 21H 
    INC SI
    LOOP ENDR
    
     
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN



