`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:22 08/24/2015 
// Design Name: 
// Module Name:    DECO 
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
module DecoTemps(
	input wire CLK,Bandera,
	input wire reset,
	input wire [7:0] UNIDADES,DECENAS,
	output wire [3:0] TempDecsalida		

    );
wire [7:0] din;	
reg [7:0] T1,T2;
reg [3:0] Tempslocal; 
reg [3:0] TempDec; 



//COMPARADOR

always @*
begin
Tempslocal = 4'b0000;

	if(din <= 8'h18)
		Tempslocal = 4'b0001;
	else if(din <= 8'h24)
		begin
			if(din >= 8'h19)
			Tempslocal = 4'b0010;
		end
	else if(din <= 8'h2F)
		begin
			if(din >= 8'h25)
				Tempslocal = 4'b0100;
		end
	else if(din <= 8'h63)
		begin
			if(din >=8'h30)
				Tempslocal = 4'b1000;
		end		
end

//Registro para DIN
reg [7:0] current_state, next_state;
always@* 
begin

	if(Bandera)
		next_state = T2 + T1; //carga
	else
		next_state = current_state;//parada
		
end

assign din = current_state; 


//REGISTROS

always @(posedge CLK, posedge reset)
begin
	if(reset)
		begin
		TempDec <= 0;
		current_state <= 0;
		end
	else
	begin
		TempDec <= Tempslocal;
		current_state <= next_state;
	end
end

assign TempDecsalida = TempDec;

	always@*
		begin
		T1 = 0;
		T2 = 0;
			case (UNIDADES)  
				8'h16: T1 = 8'h01; //1
				8'h1e: T1 = 8'h02; //2
				8'h26: T1 = 8'h03; //3
				8'h25: T1 = 8'h04; //4
				8'h2e: T1 = 8'h05; //5
				8'h36: T1 = 8'h06; //6
				8'h3d: T1 = 8'h07; //7
				8'h3e: T1 = 8'h08; //8
				8'h46: T1 = 8'h09; //9
				8'h45: T1 = 8'h00; //0
			endcase
			
			case (DECENAS) 
				8'h16: T2 = 8'h0A; //10
				8'h1e: T2 = 8'h14; //20
				8'h26: T2 = 8'h1E; //30
				8'h25: T2 = 8'h28; //40
				8'h2e: T2 = 8'h32; //50
				8'h36: T2 = 8'h3C; //60
				8'h3d: T2 = 8'h46; //70
				8'h3e: T2 = 8'h50; //80
				8'h46: T2 = 8'h5A; //90
				8'h45: T2 = 8'h00; //00
			endcase
		end

endmodule
