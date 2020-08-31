#line 1 "C:/Users/Pitias/Desktop/PROJECTS/USART/USART.c"
char uart_rd;
void main() {
TRISB=0X00;
OSCCON=0X76;
UART1_Init(9600);
Delay_ms(100);
UART1_Write_Text("Welcome Pitias \r\n");
Delay_ms(500);
UART1_Write_Text("Press 1,2&3 for the Leds\r\n");
while(1)
{
if(UART1_Data_Ready())
{
uart_rd=UART1_Read();
switch(uart_rd)
{
case '1': LATB0_bit=1;
 LATB1_bit=0;
 LATB2_bit=0;
 break;
 case '2': LATB0_bit=0;
 LATB1_bit=1;
 LATB2_bit=0;
 break;
 case '3': LATB0_bit=0;
 LATB1_bit=0;
 LATB2_bit=1;
 break;

}}}}
