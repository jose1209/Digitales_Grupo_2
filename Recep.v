`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:00:38 09/01/2015 
// Design Name: 
// Module Name:    Recep 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Recep(
	input wire CLK,flag,
	input wire [7:0] Dato,
	output wire [7:0] STtemp1,  
	output wire [7:0] STtemp2,  
	output wire STPeligro,   
	output wire STAlerta,
	output wire STGas,	
	output wire Greset	
    );
	 
	//Parametros 
	reg [2:0] stACT,stSIG;
	reg [7:0] RT1,RT2;
	reg R2;
	reg R3;
	reg R4;
	reg R5;
	
	localparam [2:0]
		ST1 = 3'b000,
		ST2 = 3'b001,
		ST3 = 3'b010,
		ST4 = 3'b011,
		ST5 = 3'b100,
		ST6 = 3'b101;
		
	localparam [7:0]
		Reset = 8'h2D,		
		Enter = 8'h5A,
		I = 8'h43,
		P = 8'h4D,
		A = 8'h1C,
		G = 8'h34,
		H = 8'h33,
		Y = 8'h35,
		N = 8'h31;
	
	initial
		begin
			RT1 = 8'h00;
			RT2 = 8'h00;
			R2 = 1'b0;
			R3 = 1'b0;
			R4 = 1'b0;
			R5 = 1'b0;
		end
		
	//Parte Secuencial FSM
always@(posedge CLK)
	begin
		if(Dato == I)
			stACT <= ST1;
		else
			stACT <= stSIG;
	end
		 
	//Parte Combinacional
always@(posedge flag)
	begin
	
		case(stACT)
			
			ST1:
				begin
					if(Dato == Enter)
						stSIG = ST2;
					else if(Dato == Reset)
						stSIG = ST4;
					else if(Dato == H)
						stSIG = ST5;
					else if(Dato == G)
						stSIG = ST6;
					else
						begin
							stSIG = ST1;
						end
				end
			ST2:						//Decenas
				begin
					if(Dato != H && Dato != A && Dato != P && Dato != G && Dato != Enter && Dato != Reset)
						begin
							RT1 = Dato;
							stSIG = ST3;
						end
					else
						stSIG = ST2;
				end
			ST3:						//Unidades
				begin
					if(Dato != H && Dato != A && Dato != P && Dato != G && Dato != Enter && Dato != Reset)
						begin
							RT2 = Dato;
							stSIG = ST1;
						end
					else
						stSIG = ST3;
				end
			ST4:	
				begin
					RT1 = 8'h00;
					RT2 = 8'h00;
					R2 = 1'b0;
					R3 = 1'b0;
					R4 = 1'b0;
					R5 = 1'b1;
					stSIG = ST1;
				end
			ST5:
				begin
					if(Dato == A)
						begin
							R3 = 1'b1;
							R2 = 1'b0;
							stSIG = ST1;
						end
					else if(Dato == P)
						begin
							R3 = 1'b1;
							R2 = 1'b1;
							stSIG = ST1;
						end
					else
						stSIG = ST5;
				end
			ST6:
				begin
					if(Dato == Y)
						begin
							R4 = 1'b1;
							stSIG = ST1;
						end
					else if(Dato == N)
						begin
							R4 = 1'b0;
							stSIG = ST1;
						end
					else
						stSIG = ST6;
				end
		endcase
	end	
					
assign STtemp1 = RT1;
assign STtemp2 = RT2;
assign STPeligro = R2;  
assign STAlerta = R3;  
assign STGas = R4; 
assign Greset = R5;

endmodule
