`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:27:06 09/07/2015
// Design Name:   Proyect
// Module Name:   C:/Lab Digitales/SegundoProyecto/TB_General.v
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

module TB_General;

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
		.Peligro(Peligro)
	);

initial forever #0.0005 CLK_G = ~CLK_G;
initial forever #5 ps2clk = ~ps2clk;
	
	// definiendo parametros
	integer i,j ;
	reg[10:0] datos_txt ;
	reg[10:0] Mem [0:3] ;
	reg enable_ps2c ;
	
		
	initial begin
		// Initialize Inputs
		CLK_G = 0;
		reset_G = 1;
		ps2data = 0;
		ps2clk = 0;
		Rx_en = 1;
	

		$readmemb ("datos.txt", Mem);
		
			repeat (5)@(posedge CLK_G)
						reset_G = 0 ;
		end
			
		
		initial begin 
		
		@(negedge reset_G,negedge ps2clk) // reset = 0
		
		for (j=0; j<3; j=j+1) 
			begin			
			datos_txt = Mem[j];
			
			repeat(5) @(posedge CLK_G)
			enable_ps2c =1 ; // habilita el clock del ps2
			
			for(i=0; i<11; i=i+1)
			
				begin
			@(negedge ps2clk)
			begin
			ps2data = datos_txt[i];
			
			end
			
			ps2data = 1 ;
			
			enable_ps2c = 0;
			
			end
			
		end	
	
		$stop;

end



/*
	initial begin
		// Initialize Inputs
		CLK_G = 0;
		reset_G = 1;
		ps2data = 0;
		ps2clk = 0;
		Rx_en = 0;
		
		#50;
	end
	
reg [10:0] mem [0:22];
reg [10:0] aux ;
integer m,i;


	initial begin
		// Initialize Inputs
		CLK_G = 0;
		reset_G = 1;
		ps2data = 1;
		ps2clk = 0;
		Rx_en = 1;
		
		#10
		reset_G = 0;

		$readmemb ("datos.txt", mem);
		for (i=0; i<3; i=i+1) 
			begin			
			aux=mem[i];
			for(m=0; m<11; m=m+1)
			@(negedge ps2clk)
			begin
			ps2data= aux[m];
			end
		
		end
		$stop;
	

	end

initial forever #0.0005 CLK_G = ~CLK_G;
initial forever #5 ps2clk = ~ps2clk;

*/
endmodule

