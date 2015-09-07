`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:00 09/02/2015
// Design Name:   Recep
// Module Name:   C:/Lab Digitales/SegundoProyecto/TB_Interpretacion.v
// Project Name:  SegundoProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Recep
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Interpretacion;

	// Inputs
	reg CLK;
	reg flag;
	reg [7:0] Dato;

	// Outputs
	wire [7:0] STtemp1;
	wire [7:0] STtemp2;
	wire STPeligro;
	wire STAlerta;
	wire STGas;
	wire Greset;

	// Instantiate the Unit Under Test (UUT)
	Recep uut (
		.CLK(CLK), 
		.flag(flag), 
		.Dato(Dato), 
		.STtemp1(STtemp1), 
		.STtemp2(STtemp2), 
		.STPeligro(STPeligro), 
		.STAlerta(STAlerta), 
		.STGas(STGas), 
		.Greset(Greset)
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

	initial begin
		// Initialize Inputs
		
		flag = 0;
		Dato = 0;
		
		
		#10;
		Dato = 8'h43;
		flag = 0;
		
		
		#10;
		Dato = 8'h43;
		flag = 1;
		
		#10;
		Dato = 8'h5A;
		flag = 0;
		
		#10;
		Dato = 8'h5A;
		flag = 1;
		
		#10;
		Dato = 8'h16;
		flag = 0;
		
		#10;
		Dato = 8'h16;
		flag = 1;
		
		#10;
		Dato = 8'h3E;
		flag = 0;
		
		#10;
		Dato = 8'h3E;
		flag = 1;
		
		#10;
		Dato = 8'h33;
		flag = 0;
		
		#10;
		Dato = 8'h33;
		flag = 1;
		
		#10;
		Dato = 8'h1C;
		flag = 0;
		
		#10;
		Dato = 8'h1C;
		flag = 1;
		
		/*#10;
		Dato = 8'h2D;
		flag = 0;
		
		#10;
		Dato = 8'h2D;
		flag = 1;*/
		
		#10;
		Dato = 8'h5A;
		flag = 0;
		
		#10;
		Dato = 8'h5A;
		flag = 1;
		
		#10;
		Dato = 8'h3D;
		flag = 0;
		
		#10;
		Dato = 8'h3D;
		flag = 1;
		
		#10;
		Dato = 8'h45;
		flag = 0;
		
		#10;
		Dato = 8'h45;
		flag = 1;
		
		#10;
		Dato = 8'h4D;
		flag = 0;
		
		#10;
		Dato = 8'h4D;
		flag = 1;
		
		#10;
		Dato = 8'h34;
		flag = 0;
		
		#10;
		Dato = 8'h34;
		flag = 1;
		
		#10;
		Dato = 8'h35;
		flag = 0;
		
		#10;
		Dato = 8'h35;
		flag = 1;
		
		#10;
		Dato = 8'h2D;
		flag = 0;
		
		#10;
		Dato = 8'h2D;
		flag = 1;
		
		#10;
		Dato = 8'h5A;
		flag = 0;
		
		#10;
		Dato = 8'h5A;
		flag = 1;
		
		#10;
		Dato = 8'h5A;
		flag = 0;
		
		#10;
		Dato = 8'h5A;
		flag = 1;
		
		#10;
		Dato = 8'h2E;
		flag = 0;
		
		#10;
		Dato = 8'h2E;
		flag = 1;
		
		#10;
		Dato = 8'h2E;
		flag = 0;
		
		#10;
		Dato = 8'h2E;
		flag = 1;
	end
      
endmodule

