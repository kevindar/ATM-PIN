LUT:	DB	11111111B
	DB	10011111B
	DB	00100101B
	DB	00001101B
	DB	00010001B	
	DB	10011001B
	DB	01001001B
	DB	01000001B
	DB	11000001B
	DB	00011111B
	DB	00000001B
	DB	00001001B
	DB 	01100011B
     	DB 	01100001B
     	DB 	00000011B
     	DB 	01110001B
     	DB 	10000101B

ORG 00H
MOV DPTR,#LUT 
MOV A,#11111111B 
MOV P0,#11111111B 
MOV P1,#11111111B 
BACK: 	MOV P1,#11111111B 
     	CLR P1.0 
	JB P1.4,NEXT1
     	MOV A,#1D  
     	ACALL DISPLAY
NEXT1:JB P1.5,NEXT2 
      MOV A,#2D
      ACALL DISPLAY
NEXT2:JB P1.6,NEXT3
      MOV A,#3D
      ACALL DISPLAY
NEXT3:JB P1.7,NEXT4
      MOV A,#4D
      ACALL DISPLAY
NEXT4:SETB P1.0
      CLR P1.1
      JB P1.4,NEXT5
      MOV A,#5D
      ACALL DISPLAY
NEXT5:JB P1.5,NEXT6
      MOV A,#6D
      ACALL DISPLAY
NEXT6:JB P1.6,NEXT7
      MOV A,#7D
      ACALL DISPLAY
NEXT7:JB P1.7,NEXT8
      MOV A,#8D
      ACALL DISPLAY
NEXT8:SETB P1.1
      CLR P1.2
      JB P1.4,NEXT9
      MOV A,#9D
      ACALL DISPLAY
NEXT9:JB P1.5,NEXT10
      MOV A,#10D
      ACALL DISPLAY
NEXT10:JB P1.6,NEXT11
       MOV A,#11D
       ACALL DISPLAY
NEXT11:JB P1.7,NEXT12
       MOV A,#12D
       ACALL DISPLAY
NEXT12:SETB P1.2
       CLR P1.3
       JB P1.4,NEXT13
       MOV A,#13D
       ACALL DISPLAY
NEXT13:JB P1.5,NEXT14
       MOV A,#14D
       ACALL DISPLAY
NEXT14:JB P1.6,NEXT15
       MOV A,#15D
       ACALL DISPLAY
NEXT15:JB P1.7,NONE
       MOV A,#16D
       ACALL DISPLAY
NONE:	ACALL DISPNONE
       LJMP BACK

DISPLAY: 
	 SECRET: CJNE A,#16D,D1
	 	 CJNE R0,#11111101B,HIDE
	 UNHIDE: MOV R0, #00000000B
	 	 LJMP BYE
	 HIDE:	 MOV R0, #11111101B
	 LJMP BYE 
	 D1:	CJNE R7,#00H,D2
		 MOV R7, A
		 MOVC A, @A+DPTR
		 MOV P2, #11111110B
		 CJNE R0,#11111101B,S1
		 MOV P0,#11111101B
		 SJMP SK1
		 S1:	MOV P0, A
		 SK1:	LJMP BYE
	 D2:	CJNE R6,#00H,D3
	 	MOV R6, A
	 	MOV A, R7
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S21
		MOV P0,#11111101B
		SJMP SK21
		S21:	MOV P0, A
	 	SK21:	MOV P2, #11111110B
	 	MOV A, R6
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S22
		MOV P0,#11111101B
		SJMP SK22
		S22: 	MOV P0, A
	 	SK22:	MOV P2, #11111101B
	 	LJMP BYE
	 D3:	CJNE R5,#00H,D4
	 	MOV R5, A
	 	MOV A, R7
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S31
		MOV P0,#11111101B
		SJMP SK31
		S31: 	MOV P0, A
	 	SK31:	MOV P2, #11111110B
	 	MOV A, R6
	 	MOVC A, @A+DPTR
		MOV P2, #11111111B
		CJNE R0,#11111101B,S32
		MOV P0,#11111101B
		SJMP SK32
		S32:	MOV P0, A
	 	SK32:	MOV P2, #11111101B
	 	MOV A, R5
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S33
		MOV P0,#11111101B
		SJMP SK33
		S33: 	MOV P0, A
	 	SK33:	MOV P2, #11111011B
	 	LJMP BYE
	 D4:	CJNE R4,#00H,BYE
	 	MOV R4, A
	 	MOV A, R7
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S41
		MOV P0,#11111101B
		SJMP SK41
		S41: 	MOV P0, A
	 	SK41:	MOV P2, #11111110B
	 	MOV A, R6
	 	MOVC A, @A+DPTR
		MOV P2, #11111111B
		CJNE R0,#11111101B,S42
		MOV P0,#11111101B
		SJMP SK42
		S42:	MOV P0, A
	 	SK42:	MOV P2, #11111101B
	 	MOV A, R5
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S43
		MOV P0,#11111101B
		SJMP SK43
		S43: 	MOV P0, A
	 	SK43:	MOV P2, #11111011B
	 	MOV A, R4
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,S44
		MOV P0,#11111101B
		SJMP SK44
		S44: 	MOV P0, A
	 	SK44:	MOV P2, #11110111B
	 	LJMP BYE
	 CLEAR: MOV P2, #11110000B
	 	MOV P0, #11111111B
	 	CLR A
	 	MOV R7, #00H
	 	MOV R6, #00H
	 	MOV R5, #00H
	 	MOV R4, #00H
	 BYE:	RET


DISPNONE:	MOV A, R7
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,SD1
	 	CJNE A,#11111111B,NULL1
	 	SJMP SD1
		NULL1:	MOV P0,#11111101B
		SJMP SKD1
		SD1: 	MOV P0, A
	 	SKD1:	MOV P2, #11111110B
	 	MOV A, R6
	 	MOVC A, @A+DPTR
		MOV P2, #11111111B
		CJNE R0,#11111101B,SD2
		CJNE A,#11111111B,NULL2
	 	SJMP SD2
	 	NULL2:	MOV P0,#11111101B
		SJMP SKD2
		SD2:	MOV P0, A
	 	SKD2:	MOV P2, #11111101B
	 	MOV A, R5
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,SD3
	 	CJNE A,#11111111B,NULL3
	 	SJMP SD3
	 	NULL3:	MOV P0,#11111101B
		SJMP SKD3
		SD3: 	MOV P0, A
	 	SKD3:	MOV P2, #11111011B
	 	MOV A, R4
	 	MOVC A, @A+DPTR
	 	MOV P2, #11111111B
	 	CJNE R0,#11111101B,SD4
	 	CJNE A,#11111111B,NULL4
	 	SJMP SD4
	 	NULL4:	MOV P0,#11111101B
		SJMP SKD4
		SD4: 	MOV P0, #11111111B
			MOV P0, A
	 	SKD4:	MOV P2, #11110111B
	 	RET
END	 	
