
_main:

;USART.c,2 :: 		void main() {
;USART.c,3 :: 		TRISB=0X00;
	CLRF        TRISB+0 
;USART.c,4 :: 		OSCCON=0X76;
	MOVLW       118
	MOVWF       OSCCON+0 
;USART.c,5 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;USART.c,6 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;USART.c,7 :: 		UART1_Write_Text("Welcome Pitias \r\n");
	MOVLW       ?lstr1_USART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_USART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;USART.c,8 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;USART.c,9 :: 		UART1_Write_Text("Press 1,2&3 for the Leds\r\n");
	MOVLW       ?lstr2_USART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_USART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;USART.c,10 :: 		while(1)
L_main2:
;USART.c,12 :: 		if(UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;USART.c,14 :: 		uart_rd=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;USART.c,15 :: 		switch(uart_rd)
	GOTO        L_main5
;USART.c,17 :: 		case '1': LATB0_bit=1;
L_main7:
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;USART.c,18 :: 		LATB1_bit=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;USART.c,19 :: 		LATB2_bit=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;USART.c,20 :: 		break;
	GOTO        L_main6
;USART.c,21 :: 		case '2': LATB0_bit=0;
L_main8:
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;USART.c,22 :: 		LATB1_bit=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;USART.c,23 :: 		LATB2_bit=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;USART.c,24 :: 		break;
	GOTO        L_main6
;USART.c,25 :: 		case '3': LATB0_bit=0;
L_main9:
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;USART.c,26 :: 		LATB1_bit=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;USART.c,27 :: 		LATB2_bit=1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;USART.c,28 :: 		break;
	GOTO        L_main6
;USART.c,30 :: 		}}}}
L_main5:
	MOVF        _uart_rd+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVF        _uart_rd+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _uart_rd+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
L_main6:
L_main4:
	GOTO        L_main2
L_end_main:
	GOTO        $+0
; end of _main
