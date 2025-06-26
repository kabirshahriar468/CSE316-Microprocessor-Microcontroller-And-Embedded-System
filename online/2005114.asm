.MODEL SMALL 
.STACK 100H 
.DATA 
  

STR DB 'eruiaaageruiaaauiugg', '$' 
VSTR  DB 'Vowel count:','$'
CSTR DB 'Consonant count:','$' 

VCNT DW 0 
CCNT DW 0
IND DW 0 
LEN DW 0   
 
.CODE 
MAIN PROC 
 MOV AX, @DATA 
 MOV DS, AX 
  
 MOV SI,OFFSET STR 
 
 FINDLEN:
    MOV CL,[SI]
    CMP CL,'$'
    JE FINDLENEND
    INC LEN 
    INC SI 
    JMP FINDLEN
 FINDLENEND:
    MOV SI,OFFSET STR
    MOV CX,LEN
    
 
 STRT1: 
    MOV BL,[SI]
    CMP BL,'a'
    JE VC
    CMP BL,'e'
    JE VC
    CMP BL,'i'
    JE VC
    CMP BL,'o'
    JE VC
    CMP BL,'u'
    JE VC  
    
    INC SI  
    INC CCNT
    JMP LP
    
 VC:
    INC SI
    INC VCNT
    
 LP: 
    LOOP STRT1
    


    
    
    
    
  MOV AH,09H
  LEA DX,VSTR
  INT 21H 
  ;MOV AH,2
  ;MOV DL,VCNT
  
  
  
    mov cx,0
    mov dx,0    
    mov ax,VCNT
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
    
    xor dx,dx 
    pop dx
     
    add dx,'0' 
    mov ah,2h
   
    int 21h
    loop end_program
    





 
    
    mov dl,13
    int 21h 
    mov ah,2
    
    mov dl,10
    int 21h
  
  MOV AH,09H
  LEA DX,CSTR
  INT 21H
  
  mov cx,0
    mov dx,0    
    mov ax,CCNT
    mov bx,10 
    
   
    
Stacks1:
    
    div bx
    push dx
    mov dx,0
    
    inc cx
    cmp ax,0
    jne Stacks1
    
    mov ah,2
    
    mov dl,13
    int 21h 
    mov ah,2
    
    mov dl,10
    int 21h
    mov bx,0  


end_program1:
    
    xor dx,dx 
    pop dx
     
    add dx,'0' 
    mov ah,2h
   
    int 21h
    loop end_program1
    
   
    
 
 
 
 MOV AH, 4CH
 INT 21H 

 
MAIN ENDP 
END MAIN     
            
            
            





