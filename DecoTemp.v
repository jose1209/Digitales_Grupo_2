`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:39 08/13/2015 
// Design Name: 
// Module Name:    DecoTemp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Decodificador , señales de temperatura : baja , normal , alta y peligrosa
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DecoTemp(

		input wire [4:0] a ,
		//input wire en  ,
		output reg [3:0] y );
	 
	 
	 always@*
	 
begin
	 y = 4'b0000;
	 
	 
	if (a <= 5'b00110)
	begin
		y = 4'b1000 ; //baja
	end
	else if(5'b00110 < a <= 5'b01001)
	begin
		y = 4'b0100;//normal
	end
	else if(5'b01001 < a <= 5'b01011)
	begin 
		y = 4'b0010;//alta
	end
	else
	begin
		y = 4'b0001;//peligrosa
	end
end 

/*
	 case({en,a})
	 
	 5'b00000 ,5'b00001 ,5'b00010 , 5'b00011 ,5'b00100 , 5'b00101 ,5'b00110 : y = 4'b1000 ; // Temp baja
	 5'b00111 ,5'b01000 ,5'b01001: y =4'b0100 ; //Tem normal
	 5'b01010 ,5'b01011: y =4'b0010 ; // Temp Alta
	 5'b01100 ,5'b01101 ,5'b01110 ,5'b01111 ,5'b10000 ,5'b10001 ,
	 5'b10001 ,5'b10010 ,5'b10011 ,5'b10100 ,5'b10101 ,5'b10110 ,
	 5'b10111 ,5'b11000 ,5'b11001 ,5'b11010 ,5'b11011 ,5'b11100 ,
	 5'b11101 ,5'b11110 ,5'b11111	: y =4'b0001 ; // Temp Peligrosa
	
	 endcase 
	
	end
	 */
endmodule
