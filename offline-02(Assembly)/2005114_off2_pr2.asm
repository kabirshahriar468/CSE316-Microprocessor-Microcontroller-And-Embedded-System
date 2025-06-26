.MODEL SMALL
.STACK 100H
.DATA

NUM1 DW 0  
NUM2 DW 0  
RESULT DW 0
res DW 0



.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;;first integer number input 
    MOV AX,00
    MOV BX,10
    MOV CX,00
REPEAT:
    MOV AH,01H
    INT 21H 
    CMP AL,0DH
    JE REPEAT_END
    MOV AH,0
    SUB AL,30H
    MOV CX,AX
    MOV AX,BX
    MUL NUM1
    ADD AX,CX
    MOV NUM1,AX
    JMP REPEAT

REPEAT_END:  
    
   


    mov res, 0
    mov ax,NUM1 
    mov bx,10   
    mov NUM1,0
    CALL DIGIT_SUM
      
outs:
    mov cx,0
    mov dx,0    
    mov ax,NUM1
    mov bx,10 
    
   
    
Stacks:
    
    div bx
    push dx
    mov dx,0
    
    inc cx
    cmp ax,0
    jne Stacks
    
    mov ah,2
    
    mov dl,13
    int 21h 
    mov ah,2
    
    mov dl,10
    int 21h
    mov bx,0  


end_program:
    ; Output: Total number of chocolates  
    xor dx,dx 
    pop dx
     
    add dx,'0' 
    mov ah,2h
   
    int 21h
    loop end_program
    ; Here, you can use the value in AX as needed (printing/displaying, etc.)

    ; Exit the program
    mov ah, 4Ch    ; DOS function: Exit program
    int 21h          ; Make DOS system call


MAIN ENDP 
DIGIT_SUM PROC
    
   cmp ax,0
   je return
   XOR DX,DX 
   div bx
   add NUM1,dx 
   CALL DIGIT_SUM
   
   
    

return:    
    
RET

DIGIT_SUM ENDP







END MAIN