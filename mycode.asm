org 100h

.model small
.data
.code        










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Read Data From User Start
ReadDataFromUser:
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h  
    
    add bl,al
    sub bl,60h
    mov al,30
    mul bl
    mov bl,al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Read Data From User End
                                                         
          
          
          
          
                                                         
                                                         
                                                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Initilazeing Cpu For Draw Line Start
GetInitGraphic:
    mov ah,00
    mov al,13h
    int 10h       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Initilazeing Cpu For Draw Line End         


                         

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Horiantal Line Start         
DrawHorLine:
mov dx,25;ROW POSITION
mov cx,150;COLNUM POSITION



C:
mov ah,0ch
mov al,05 ;PIXELS COLOR
int 10h

inc dx
cmp dx,150 ;Line Long
jnz C          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Horiantal Line End            



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Vetical Line Start
DrawVerLine:
mov dx,90;ROW POSITION
mov cx,80;COLNUM POSITION



R:
mov ah,0ch
mov al,05 ;PIXELS COLOR
int 10h

inc cx
cmp cx,220 ;Line Long
jnz R              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Vettical Line End




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Y=ax+b Start
DrawYLine:         
mov dx,25;ROW POSITION
mov cx,105;COLNUM POSITION



;Draw Horiantal Line
Y:
mov ah,0ch
mov al,02 ;PIXELS COLOR
int 10h  

inc dx
cmp dx,150 ;Line Long
inc cx
cmp cx,220 ;Line Long                            
jnz Y              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Get Draw Y=ax+b End


                                                 
                                                 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exit From Program When User Press Eascape Button On Keyboard Start
read:
mov ah, 1 
int 16h 
cmp al, ' '
jae clear         
cmp al,27
jae exit
jne read
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exit From Program When User Press Eascape Button On Keyboard End




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exit From Program Start
exit:
MOV AH, 4CH
MOV AL, 01 ;your return code.
INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Exit From Program End

                        
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Clear Screen Start
clear: 
mov ax, 3
int 10h
jmp ReadDataFromUser
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Clear Screen End









