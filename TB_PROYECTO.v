`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:45:19 09/06/2015
// Design Name:   Proyect
// Module Name:   C:/Lab Digitales/SegundoProyecto/TB_PROYECTO.v
// Project Name:  SegundoProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Proyect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_PROYECTO;

	// Inputs
	reg CLK_G;
	reg reset_G;
	reg ps2data;
	reg ps2clk;
	reg Rx_en;

	// Outputs
	wire [3:0] Temps;
	wire RESETFSM;
	wire Gas;
	wire Alerta;
	wire Peligro;

	// Instantiate the Unit Under Test (UUT)
	Proyect uut (
		.CLK_G(CLK_G), 
		.reset_G(reset_G), 
		.ps2data(ps2data), 
		.ps2clk(ps2clk), 
		.Rx_en(Rx_en), 
		.Temps(Temps), 
		.RESETFSM(RESETFSM), 
		.Gas(Gas), 
		.Alerta(Alerta), 
		.Peligro(Peligro), 
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
		reset_G = 1;
		ps2data = 0;
		ps2clk = 0;
		Rx_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

