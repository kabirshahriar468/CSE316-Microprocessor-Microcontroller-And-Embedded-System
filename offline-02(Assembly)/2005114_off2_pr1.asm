.MODEL SMALL
.STACK 100H
.DATA

NUM1 DW 0  
NUM2 DW 0  
RESULT DW 0
chocolates DW 0



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
    CMP AL,' '
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
    
    ;;2nd integer number input  
    MOV AX,00
    MOV BX,10
    MOV CX,00
WHILE:
    MOV AH,01H
    INT 21H 
    CMP AL,0DH
    JE WHILE_END
    MOV AH,0
    SUB AL,30H
    MOV CX,AX
    MOV AX,BX
    MUL [NUM2]
    ADD AX,CX
    MOV [NUM2],AX
    JMP WHILE

WHILE_END:


    mov ax, NUM1
    mov bx, NUM2

    ; Check for division by zero
    cmp bl, 0
    je  division_by_zero_error

    ; Initialize chocolates count
    mov chocolates, ax

    ; Loop to eat chocolates
count_chocolates:
    
    cmp ax, bx
    jl outs 
    xor dx,dx

    
    div bx

   
    add chocolates, ax

    
    add dx,ax
    mov ax, dx

   
    jmp count_chocolates  
outs:
    mov cx,0
    mov dx,0    
    mov ax,chocolates 
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
    
    mov ah, 4Ch      ; DOS function: Exit program
    int 21h          ; Make DOS system call

division_by_zero_error:
    mov ax, 4C00h    ; DOS function: Exit program
    int 21h          ; Make DOS system call
     
     
    

    
    
    
    
    
    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN