.MODEL SMALL 
.STACK 100H 
.DATA 
  

UpL DB 'Uppercase letter', '$'
LowL DB 'Lowercase letter', '$'
Other DB 'Not an alphanumeric value','$'
Num DB 'Number','$'
 
.CODE 
MAIN PROC 
 MOV AX, @DATA 
 MOV DS, AX 
  
 
 
 MOV AH, 01H
 INT 21H
 MOV BL,AL                  ;a in BL
 
 
 
 MOV AH,02H
 MOV DL, 0DH                ; carriage return
 INT 21H

 MOV DL, 0AH                ; line feed
 INT 21H  
 
 
 
 IF:
    CMP BL,'0'               
    JL IF1
        CMP BL,'9'           
        JG IF2           
            MOV AH, 09H     
            LEA DX, Num 
            INT 21H
            JMP END1  
    IF2:
        CMP BL,'A'           
        JL IF1
            CMP BL,'Z'
            JG IF3
                MOV AH,09H
                LEA DX,UpL
                INT 21H
                JMP END1
        IF3:
            CMP BL,'a'
            JL IF1
                CMP BL,'z'
                JG IF1
                    MOV AH,09H
                    LEA DX,LowL
                    INT 21H
                    JMP END1
                    
            
 IF1:
    MOV AH,09H
    LEA DX,Other
    INT 21H
    JMP END1
    
 END1:  
 ;interrupt to exit
 MOV AH, 4CH
 INT 21H 

 
MAIN ENDP 
END MAIN 



