`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:24 09/02/2015
// Design Name:   DecoTemps
// Module Name:   C:/Lab Digitales/SegundoProyecto/TB_DECOTEMPS.v
// Project Name:  SegundoProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DecoTemps
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_DECOTEMPS;

	// Inputs
	reg CLK,reset;
	reg [7:0] UNIDADES,DECENAS;

	// Outputs
	wire [3:0] TempDecsalida;


	// Instantiate the Unit Under Test (UUT)
	DecoTemps uut (
		.CLK(CLK), 
		.reset(reset), 
		.UNIDADES(UNIDADES), 
		.DECENAS(DECENAS), 
		.TempDecsalida(TempDecsalida)
	);
	
//Simula clock Nexys 3	
localparam T = 10;
always
		begin
			CLK = 1'b1;
			#(T/2) ;
			CLK = 1'b0;
			#(T/2) ;
		end

	initial
	begin
		// Initialize Inputs
		reset = 1;
		UNIDADES = 0;
		DECENAS = 0;
		// Wait 100 ns for global reset to finish
		#50;
      #10 reset = 0;
		// Add stimulus here
		#50;
		UNIDADES = 8'h1e;			//0001
		DECENAS = 8'h16;
		
		#50;
		UNIDADES = 8'h3d;			//0010
		DECENAS = 8'h1e;
		
		#50;
		UNIDADES = 8'h46;			//0001
		DECENAS = 8'h45;
		
		#50;
		UNIDADES = 8'h45;			//1000
		DECENAS = 8'h3e;
		
		#50;
		UNIDADES = 8'h3e;			//0100
		DECENAS = 8'h26;
		
		#50;
		UNIDADES = 8'h16;			//0001
		DECENAS = 8'h16;
		
		#50;
		UNIDADES = 8'h36;			//0010
		DECENAS = 8'h26;
		
		#50;
		UNIDADES = 8'h46;			//1000
		DECENAS = 8'h46;
		
		#50;
		UNIDADES = 8'h45;			//0001
		DECENAS = 8'h45;
		
		#50;
		UNIDADES = 8'h3d;			//0100
		DECENAS = 8'h25;
		
		#50;
		UNIDADES = 8'h46;			//1000
		DECENAS = 8'h25;
		
	end
      
endmodule

