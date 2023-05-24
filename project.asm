;	project coal(candy crush)
;	by:- Haaris Anjum(20I-2607)
;		 Usman Siddiqui(20I-0586)
.model small
.stack 100h
.data
	GameName db "CANDY CRUSH  ","$"
	enterNameMSG db "ENTER YOUR NAME: ","$"
	GroupMembers db "GROUP MEMBERS: ","$"
	userName db 10 DUP(?)
	welcome db "WELCOME  ","$"
	instructions db "INSTRUCTIONS","$"
	Instruction1 db "CANDY CRUSH is a MATCH-THREE Game","$"
	Instruction2 db "SWAP TWO DIFFERENT CANDIES ON THE BOARD TO MAKE ROW OR COLUMN OF 3","$"
	Instruction4 db "FOR EACH MATCH YOU GET POINTS. THERE ARE TOTAL OF 15 MOVES","$"
	Instruction5 db "YOU ARE PROCEEDED TO NEXT LEVEL ONCE YOU REACH A CERTAIN SCORE","$"
	grid db 49 dup(?)				; our grid of 7*7
	counter dw 0			;counter used for triangle 
	count dw 0				;count to place different shapes on the grid
	x_cord dw 0 			;x cordinate for square 
	y_cord	dw 0		;y cordinate for square 
	temp_x dw 0			; temporary x cordinate 
	temp_y dw 0			; temporary y cordinate 
	rand db 0			; store the generated random number
	Bomb db "B","$"		;colour bomb string 	
	x dw 0				; x cordinate for placement of shapes
	y dw 0				; y cordinate for placement of shapes
.code


Makegrid proc
;*******************************************************
;horizontal line code for grid
;*******************************************************
	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;first horizontal line
	mov dx,130 ;y-axis
	h1:
	int 10h
	inc cx
	cmp cx,629
	jle h1

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;second horizontal line
	mov dx,180 ;y-axis
	h2:
	int 10h
	inc cx
	cmp cx,629
	jle h2

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;third horizontal line
	mov dx,230 ;y-axis
	h3:
	int 10h
	inc cx
	cmp cx,629
	jle h3

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;fourth horizontal line
	mov dx,280 ;y-axis
	h4:
	int 10h
	inc cx
	cmp cx,629
	jle h4

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;fifth horizontal line
	mov dx,330 ;y-axis
	h5:
	int 10h
	inc cx
	cmp cx,629
	jle h5

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;sixth horizontal line
	mov dx,380 ;y-axis
	h6:
	int 10h
	inc cx
	cmp cx,629
	jle h6

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;seventh horizontal line
	mov dx,430 ;y-axis
	h7:
	int 10h
	inc cx
	cmp cx,629
	jle h7

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;eight horizontal line
	mov dx,479 ;y-axis
	h8:
	int 10h
	inc cx
	cmp cx,629
	jle h8

;*******************************************************
;vertical line code for grid
;*******************************************************
	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,0 ;x-axis        ;first vertical line
	mov dx,130 ;y-axis
	v1:
	int 10h
	inc dx
	cmp dx,479
	jle v1

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,90 ;x-axis        ;second vertical line
	mov dx,130 ;y-axis
	v2:
	int 10h
	inc dx
	cmp dx,479
	jle v2

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,180 ;x-axis        ;third vertical line
	mov dx,130 ;y-axis
	v3:
	int 10h
	inc dx
	cmp dx,479
	jle v3

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,270 ;x-axis        ;fourth vertical line
	mov dx,130 ;y-axis
	v4:
	int 10h
	inc dx
	cmp dx,479
	jle v4

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,360 ;x-axis        ;fifth vertical line
	mov dx,130 ;y-axis
	v5:
	int 10h
	inc dx
	cmp dx,479
	jle v5

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,450 ;x-axis        ;sixth vertical line
	mov dx,130 ;y-axis
	v6:
	int 10h
	inc dx
	cmp dx,479
	jle v6

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,540 ;x-axis        ;seventh vertical line
	mov dx,130 ;y-axis
	v7:
	int 10h
	inc dx
	cmp dx,479
	jle v7

	mov ah,0ch
	mov al,03 ; which mode is on  
	mov bh,0 ; page number
	mov cx,630 ;x-axis        ;eigth vertical line
	mov dx,130 ;y-axis
	v8:
	int 10h
	inc dx
	cmp dx,479
	jle v8

ret
Makegrid endp

;*********************************************
;	Drawing different shapes
;*********************************************

drawSquare proc uses cx dx

	MOV AH,0CH
	MOV AL,04H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,30
	add y_cord,30


	LOOP1:
	int 10h
	inc cx
	CMP CX,x_cord
	jne LOOP1

	LOOP2:
	mov cx,temp_x
	INT 10H
	inc DX
	CMP DX,y_cord
	jne LOOP1

	EXIT:
	ret

drawSquare endp

drawTrapezium proc uses cx dx

	MOV AH,0CH
	MOV AL,03H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,30
	add y_cord,30


	LOOP1:
	int 10h
	inc cx
	CMP CX,x_cord
	jne LOOP1

	LOOP2:
	inc x_cord
	inc temp_x
	mov cx,temp_x
	INT 10H
	inc DX
	CMP DX,y_cord
	jne LOOP1

	EXIT:
	ret

drawTrapezium endp

drawRightTriangle proc uses cx dx


	MOV AH,0CH
	MOV AL,02H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,1
	add y_cord,30


	LOOP1:
	int 10h
	inc cx
	CMP CX,x_cord
	jne LOOP1

	LOOP2:
	inc x_cord
	mov cx,temp_x
	INT 10H
	inc DX
	CMP DX,y_cord
	jne LOOP1

	EXIT:
	ret

ret
drawRightTriangle endp

drawRectangle proc uses cx dx

	MOV AH,0CH
	MOV AL,05H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,50
	add y_cord,30


	LOOP1:
	int 10h
	inc cx
	CMP CX,x_cord
	jne LOOP1

	LOOP2:
	mov cx,temp_x
	INT 10H
	inc DX
	CMP DX,y_cord
	jne LOOP1

	EXIT:
	ret

 drawRectangle endp

drawINTriangle proc uses cx dx

	MOV AH,0CH
	MOV AL,09H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,30
	add y_cord,30


	LOOP1:
	int 10h
	inc cx
	CMP CX,x_cord
	jne LOOP1

	LOOP2:
	dec x_cord
	mov cx,temp_x
	INT 10H
	inc DX	
	CMP DX,y_cord	
	jne LOOP1

	EXIT:
	ret

drawINTriangle endp

;*********************************************
;	Drawing bomb
;*********************************************

drawBomb proc uses cx dx

	; MOV AH,0CH
	; MOV AL,04H

	MOV x_cord,cx ; to move x cordinates to the variable
	MOV y_cord,dx ; to move y cordinates to the variable 
	mov temp_x,cx ; to move x cordinate to temp variable 
	mov temp_y,dx ; to move y cordinate to temp variable 
	add x_cord,30
	add y_cord,30


	mov dh, 11h			;Row Number 
	mov dl, 20h		    ;COL Number 
	mov si, 0
	
	displayBomb:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, Bomb[si]
		mov bl, 0Eh  ;Red Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp Bomb[si], "$"
		jne displayBomb


	EXIT:
	ret

drawBomb endp

;**********************************************
;	code to generate random shapes
;**********************************************
generateRandom proc	

	call Delay
	MOV AH,0H
	INT 01AH

	MOV AX,DX
	MOV DX,0
	MOV BX,4
	DIV BX
	MOV rand,DL

	ret

generateRandom endp


Delay PROC

MOV CX,0

startdelay:
	MOV BX,0
	CMP CX,300
	JE enddelay
	INC CX
	delay2:
	CMP BX,400
	JE startdelay
	INC BX
	JMP delay2
enddelay:

ret
Delay ENDP

;****************************************************
;	code that fills up the grid with random shapes
;****************************************************	
fillgrid proc		

	mov cx, 20	;x-axis
	mov dx, 140	;y-axis
	mov x,20 ;x-axis
	mov y,140 ;y-axis
	mov si, 49

	.while(si > 0)
		.if (si == 42 || si == 35 || si == 28 || si == 21 || si == 14 || si == 7)
;		mov cx, 20
		mov x,20 ; update value of x-axis
;		add dx, 50
		add y,50 ; update value of y-axis
		.endif
	call generateRandom
	mov ah, 0Ch
	
; call drawINTriangle
; call drawRectangle
; call drawRightTriangle
; call drawSquare
; call drawTrapezium
	.if (rand == 0)
	mov cx,x
	mov dx,y
	call drawSquare
	.endif

	.if (rand == 1)
	mov cx,x
	mov dx,y
	call drawINTriangle
	.endif

	.if (rand == 2)
	mov cx,x
	mov dx,y
	call drawRightTriangle
	.endif

	.if (rand == 3)
	mov cx,x
	mov dx,y
	call drawTrapezium
	.endif
	
	.if (rand == 4)
	mov cx,x
	mov dx,y
	call drawRectangle
	.endif

	; .if (rand == 4)
	; mov cx,x
	; mov dx,y
	; call drawRectangle
	; .endif

	int 10h

;	add cx, 90
	add x,90 ; update value of x-axis
	dec si
	.endw

	ret
fillgrid endp

;***********************************************
;	code for the interface 
;***********************************************
interface proc 

;////////////////////////////////////////////////////////////////////////////
	mov bx, 0
	mov cx, 42  ;X-Axis
	mov dx, 112 ;Y-Axis
	topLine:
		mov ah, 0Ch ;Writng Pixel
		mov al, 03h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc cx
		inc bx
		cmp bx, 500
		jb topLine
	mov bx, 0
	mov cx, 42	;X-Axis
	mov dx, 366 ;Y-Axis
	bottomLine:
		mov ah, 0Ch ;Writng Pixel
		mov al, 09h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc cx
		inc bx
		cmp bx, 500
		jb bottomLine	
	mov bx, 0
	mov cx, 597 ;X-Axis
	mov dx, 112 ;Y-Axis
	rightLine:
		mov ah, 0Ch ;Writng Pixel
		mov al, 05h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc dx
		inc bx
		cmp bx, 200
		jb rightLine	
	mov bx, 0
	mov cx, 42 ;X-Axis
	mov dx, 112 ;Y-Axis
	leftLine:
		mov ah, 0Ch ;Writng Pixel
		mov al, 0Eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc dx
		inc bx
		cmp bx, 200
		jb leftLine	
;////////////////////////////////////////////////////////////////////////////
	
	mov dh, 04h		;Row Number 
	mov dl, 23h		;COL Number 
	mov si, 0
	
	PrintGameName:
		mov ah, 02				;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, GameName[si]
		mov bl, 04h  ;Red Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp GameName[si], "$"
		jne PrintGameName 	


;////////////////////////////////////////////////////////////////////////////

	mov dh, 0Bh			;Row Number 
	mov dl, 09h		    ;COL Number 
	mov si, 0
	
	EnterNameMessage:
		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, enterNameMSG[si]
		mov bl, 03h  ;Red Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp enterNameMSG[si], "$"
		jne EnterNameMessage 	
	;////////////////////////////////////////////////////////////////////////////

	mov dl, 1Ah			;COL Number 
	mov dh, 0Bh		    ;ROW Number 
	mov ah, 02			;Move Cursor ah,02
	int 10h
		
	mov SI, offset userName
	mov cx,0607h
	mov ah, 01h

	NameInput:
		int 21h
		mov [si], al
		inc si
		cmp al, 13
		jne NameInput
			
;////////////////////////////////////////////////////////////////////////////
	mov dh, 0Fh			;Row Number 
	mov dl, 20h		    ;COL Number 
	mov si, 0
	
	WelcomeMessage:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, welcome[si]
		mov bl, 07h  ;white Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp welcome[si], "$"
		jne WelcomeMessage

ret
interface endp

;***********************************************
;	code to open a new window 
;***********************************************
newWindow proc 

L1:
	mov ah,01h
 	int 21h
	cmp al,13
	jne L1

ret
newWindow endp

;***********************************************
;	code to display the rules of the game 
;***********************************************
RulesofGame proc

	mov ah,00h
	mov al,12h ; Setting video mode 640x480 pixels, 16 COLOURS
	int 10h
;////////////////////////////////////////////////////////////////////////////

	mov dh, 03h			;Row Number 
	mov dl, 20h		    ;COL Number 
	mov si, 0
	
	InstructionMessage:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, instructions[si]
		mov bl, 07h  ;Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp instructions[si], "$"
		jne InstructionMessage

;////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////
	mov bx, 0
	mov cx, 42  ;X-Axis
	mov dx, 112 ;Y-Axis
	topLine1:
		mov ah, 0Ch ;Writng Pixel
		mov al, 03h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc cx
		inc bx
		cmp bx, 500
		jb topLine1
	mov bx, 0
	mov cx, 42	;X-Axis
	mov dx, 366 ;Y-Axis
	bottomLine1:
		mov ah, 0Ch ;Writng Pixel
		mov al, 09h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc cx
		inc bx
		cmp bx, 500
		jb bottomLine1	
	mov bx, 0
	mov cx, 597 ;X-Axis
	mov dx, 112 ;Y-Axis
	rightLine1:
		mov ah, 0Ch ;Writng Pixel
		mov al, 05h
		push bx
		mov bh, 0
		int 10h
		pop bx
		inc dx
		inc bx
		cmp bx, 200
		jb rightLine1	
	mov bx, 0
	mov cx, 42 ;X-Axis
	mov dx, 112 ;Y-Axis
	leftLine1:
		mov ah, 0Ch ;Writng Pixel
		mov al, 0Eh
		push bx
		mov bh, 0
		int 10h
		pop bx
		
		inc dx
		inc bx
		cmp bx, 200
		jb leftLine1	
;//////////////////////////////////////////////////////////////////

	mov dh, 0Bh			;Row Number 
	mov dl, 06h		    ;COL Number 
	mov si, 0
	
	Instruction1Message:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, Instruction1[si]
		mov bl, 07h  ; Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp Instruction1[si], "$"
		jne Instruction1Message
;////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////
	

	mov dh, 0Dh			;Row Number 
	mov dl, 06h		    ;COL Number 
	mov si, 0
	
	Instruction2Message:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, Instruction2[si]
		mov bl, 07h  ; Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp Instruction2[si], "$"
		jne Instruction2Message
;////////////////////////////////////////////////////////////////////////////


	mov dh, 0Fh			;Row Number 
	mov dl, 06h		    ;COL Number 
	mov si, 0
	
	Instruction4Message:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, Instruction4[si]
		mov bl, 07h  ; Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp Instruction4[si], "$"
		jne Instruction4Message
;////////////////////////////////////////////////////////////////////////////

	mov dh, 11h			;Row Number 
	mov dl, 06h		    ;COL Number 
	mov si, 0
	
	Instruction5Message:

		mov ah, 02	;Move Cursor ah,02
		int 10h
		mov ah, 09 ;Print string
		mov al, Instruction5[si]
		mov bl, 07h  ; Colour
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp Instruction5[si], "$"
		jne Instruction5Message

ret
RulesofGame endp

main proc

	mov ax,@data
	mov ds,ax

	mov ah,00h
	mov al,12h ; Setting video mode 640x480 pixels, 16 COLOURS
	int 10h

	call interface ; procedure to call forth the interface
	call newWindow ; procedure to call forth a new window
	call RulesofGame ; procedure to call the rules window 	
	call newWindow

	mov ah,00h ;to set in video mode
	mov al,12h ;640*480 (on / off) for on it is white/ and for off it is white  
	int 10h

	call Makegrid ; procedure which creates the grid
	call fillgrid ; procedure which fills the grid with shapes 

	mov ah,0 ; reading keyboard 
	int 16h

	mov ax,3 ;return to text mode
	int 10h

	mov ah,4ch
	int 21h

main endp
end main
