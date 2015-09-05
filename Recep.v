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
	input wire CLK,flag,// bandera 
	input wire [7:0] DATO,
	output wire [7:0] STtemp1,  
	output wire [7:0] STtemp2,  
	output wire STPeligro,   
	output wire STAlerta,
	output wire STGas ,	
	output wire Greset	
    );
	
	reg [2:0] stACT,stSIG;
	reg [7:0] RT1,RT2;
	reg R2,R3,R4,R5;
	
	localparam [7:0]
		reset = 8'h2D,		
		enter = 8'h5A,
		P = 8'h4D,
		A = 8'h1C,
		G = 8'h34,
		H = 8'h33;
		
	localparam [2:0]
		ST1 = 3'b000,
		ST2 = 3'b001,
		ST3 = 3'b010,
		ST4 = 3'b011,
		ST5 = 3'b100;
	
				
		always@(posedge CLK) 
		begin
			if(DATO == enter)
				stACT <= ST1;
			else 
				stACT <= stSIG;			
		end

initial
begin
RT1 = 8'h00;
RT2 = 8'h00;
R2 = 1'b0;
R3 = 1'b0;
R4 = 1'b0;
R5 = 1'b0;
end

always@(posedge flag)
	begin
		case (stACT)
			ST1:		
				begin
					if(DATO == enter)
							stSIG <= ST1;
					else if(DATO == H)
						stSIG <= ST3;
					else if(DATO == reset)
						begin				
							stSIG <= ST5;
						end
					else
						begin
							RT1 <= DATO;
							stSIG <= ST2;						
						end
				end
				
			ST2: 
				begin
					RT2 <= DATO;
					stSIG <= ST3;
				end
				
			ST3:
				begin
					if(DATO == enter)
						stSIG <= ST1;
					else if (DATO == P)
						begin
							R2 <= 1'b1;   // registro peligro
							R3 <= 1'b1; // registro alerta humo
							stSIG <= ST4;
						end
					else if (DATO == A)
						begin
							R3 <= 1'b1; // registro alerta humo
							R2 <= 1'b0;   // registro peligro
							stSIG <= ST4;
						end
					else if(DATO == reset)
						begin				
							stSIG <= ST5;
						end
					else 
						stSIG <= ST3;
				end
				
			ST4:
				begin
					if(DATO == enter)
						stSIG <= ST1;
					else if(DATO == H)
						stSIG <= ST3;
					else if (DATO == G)
						begin
							R4 <= 1'b1; // registro pesencia de gas
							stSIG <= ST1;
						end
					else if(DATO == reset)
						begin				
							stSIG <= ST5;
						end
					else 
						stSIG <= ST4;
				end
			
			ST5:
				begin
					RT1 <= 8'h00;
					RT2 <= 8'h00;
					R2 <= 1'b0; 
					R3 <= 1'b0;
					R4 <= 1'b0;
					R5 <= 1'b1;
					stSIG <= ST1;
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











