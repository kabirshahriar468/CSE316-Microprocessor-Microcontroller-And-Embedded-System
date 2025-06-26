.MODEL SMALL 
.STACK 100H 
.DATA 
  
;The string to be printed 
STRING DB 'All letters are equal', '$'
  
.CODE 
MAIN PROC 
 MOV AX, @DATA 
 MOV DS, AX 
  
 
 
 MOV AH, 01H
 INT 21H
 MOV BL,AL     ;a in BL
 INT 21H
 
 INT 21H
 MOV BH,AL     ;b in BH
 INT 21H
 
 INT 21H
 MOV CL,AL     ;c in CL
 
 MOV AH,02H
 MOV DL, 0DH                ; carriage return
 INT 21H

 MOV DL, 0AH                ; line feed
 INT 21H  
 
 
 
 IF:
    CMP BL,BH               ;check a=b?
    JNE IF1
        CMP BH,CL           ;a=b ,now check b=c?
        JNE IF1_1           
            MOV AH, 09H     ;a=b=c
            LEA DX, STRING 
            INT 21H
            JMP END1  
    IF1_1:
        CMP BH,CL           ;a=b && b!=c , check b>c?
        JL IF1_2
            ;MOV AH,O2H
            MOV DL,CL       ;a=b && b!=c && b>c,so a=b>c, output=c
            INT 21H 
            JMP END1
    IF1_2:
        ;MOV AH,O2H
        MOV DL,BH           ;a=b && b<c
        INT 21H 
        JMP END1
            
IF1:
    CMP BH,CL               ;a!=b,check b=c?
    JNE IF2
        CMP BL,BH           ;a!=b=c, check a>b?
        JL IF1_3
            ;MOV AH,O2H
            MOV DL,CL       ;a>b=c
            INT 21H 
            JMP END1
    IF1_3:
        ;MOV AH,O2H
        MOV DL,BL           ;a<b=c
        INT 21H 
        JMP END1
IF2:                        ;a!=b && b!=c && check a=c?
    CMP BL,CL
    JNE IF3
        CMP BL,BH           ;a=c!=b && check a>b?
        JL IF1_4
            ;MOV AH,O2H
            MOV DL,BH       ;a=c>b
            INT 21H 
            JMP END1
    IF1_4:
        ;MOV AH,O2H
        MOV DL,BL           ;a=c<b
        INT 21H 
        JMP END1 
IF3:
    CMP BL,BH               ;a!=b!=c && check a>b?
    JL IF4
        CMP BH,CL           ;a>b && check b>c ?
        JL IF1_5
            ;MOV AH,O2H
            MOV DL,BH       ;a>b>c
            INT 21H 
            JMP END1 
    IF1_5:                  
        CMP BL,CL           ;a>b && b<c ,check a>c?
        JL IF1_6
            ;MOV AH,O2H
            MOV DL,CL       ;a>c>b
            INT 21H 
            JMP END1
    IF1_6:
        ;MOV AH,O2H         ;c>a>b
        MOV DL,BL
        INT 21H 
        JMP END1 
        
IF4:
    CMP BH,CL               ;a<b && check b>c?
    JL IF5
        CMP CL,BL           ;a<b && b>c && check c>a?
        JL IF1_7            
            ;MOV AH,O2H
            MOV DL,CL       ;b>c>a
            INT 21H 
            JMP END1
    IF1_7:
        ;MOV AH,O2H
        MOV DL,BL           ;b>a>c
        INT 21H 
        JMP END1
            
               
IF5: 
    ;MOV AH,O2H
    MOV DL,BH               ;a<b && b<c
                            ;a<b<c
    INT 21H 
    JMP END1             
    

END1:  
 ;interrupt to exit
 MOV AH, 4CH
 INT 21H 

 
MAIN ENDP 
END MAIN 