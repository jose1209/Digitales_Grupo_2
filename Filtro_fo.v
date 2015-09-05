`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:03 08/30/2015 
// Design Name: 
// Module Name:    Filtro_fo 
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
module Filtro_Fo(
	input wire CLK,
	input wire reset,
	input wire tick,
	input wire [7:0] din,
	output wire rx_tick
    );
	 
reg [1:0] state,n_state;
reg n_tick;

localparam 
	idle = 2'b00,
	read = 2'b01,
	load = 2'b10;

always@(posedge CLK, posedge reset)
begin
	if(reset)begin
		state <= idle;
	end
	else begin
		state <= n_state;
	end
end

always@*
begin
n_state = state;
n_tick = 0;

case (state)
idle:
	begin
	if(tick & din == 8'hF0) 
		n_state = read;
	end
read: 
	if (tick)
	begin
	case(din)

		// parametros de temperatura
		
		8'h16: n_state = load; //1
		8'h1E: n_state = load; //2
		8'h26: n_state = load; //3
		8'h25: n_state = load; //4
		8'h2E: n_state = load; //5	
		8'h36: n_state = load; //6   
		8'h3D: n_state = load; //7
		8'h3E: n_state = load; //8
		8'h46: n_state = load; //9
		8'h45: n_state = load; //0
		
		// parametros Letras
		
		8'h33: n_state = load; //H
		8'h1C: n_state = load; //A
		8'h4D: n_state = load; //P
		8'h43: n_state = load; //I
		8'h35: n_state = load; //Y
		8'h31: n_state = load; //N
		8'h34: n_state = load; // G
		8'h5A: n_state = load; //enter
		8'h2D: n_state = load; //R
		
		//Lo que se realiza con F0
		
		8'hF0: n_state = read;
		default: n_state = idle;
	endcase
	end
load:
	begin
	n_state = idle;
	n_tick = 1'b1;
	end

endcase
end

assign rx_tick = n_tick;

endmodule





