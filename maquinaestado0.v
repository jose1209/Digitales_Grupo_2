`timescale 1ns / 1ps

module Primermaquina(
	input wire P_H,A_H,G,clk,rst,
	output reg L_AH,L_PH,L_G,
	output reg [10:0] sseg
);


localparam[2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 =3'b011, S4 = 3'b100, S5 = 3'b101;
localparam[1:0] L0 = 2'b00, L1 = 2'b01, L2 = 2'b10, L3 = 2'b11;
reg[1:0] sel,sel_next;
reg[2:0] est_actual, est_siguiente;


always @(posedge clk, posedge rst)
	if(rst)
begin	
	est_actual <= S0;
	sel <= L0;
end
	else
begin
	est_actual <= est_siguiente;
	sel <= sel_next;
end
	
always @*	

begin
	sseg = 0;
	sel_next = sel;
	est_siguiente = est_actual;
	L_AH = 0;
	L_PH = 0;
	L_G = 0;
	
			case(est_actual)
				S0: 
					begin
						if (A_H && !P_H && !G) 
							est_siguiente = S1;
						else if(A_H && P_H && !G)
							est_siguiente = S2;
						else if(G && !A_H && !P_H)
							est_siguiente = S3;
						else if(G && A_H && !P_H)
							est_siguiente = S4;
						else if(G && A_H && P_H)
							est_siguiente = S5;
						
						else
							begin
							est_siguiente = S0;			
							L_AH = 0;
							L_PH = 0;
							L_G = 0;
								
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco	  
								sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b10000000111;  //0
								sel_next = L0;
								end
							endcase
						end
					end
					
				S1:
					begin
						if (A_H && P_H && !G) 
							est_siguiente = S2;
						else if(!G && !A_H && !P_H)
							est_siguiente = S0;
						else if(G && !A_H && !P_H)
							est_siguiente = S3;
						else if(G && A_H && !P_H)
							est_siguiente = S4;
						else if(G && A_H && P_H)
							est_siguiente = S5;
						else
							begin
							est_siguiente = S1;
							
							
							
								L_AH = 1;
								L_PH = 0;
								L_G = 0;
								
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco	  
							   sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b11110010111;  //1
								sel_next = L0;
								end
							endcase
								
						end
					end
								
				S2:		
					begin
						if (G && !A_H && !P_H) 
							est_siguiente = S3;
						else if(!G && !A_H && !P_H)
							est_siguiente = S0;
						else if(A_H && !P_H && !G) 
							est_siguiente = S1;
						else if(G && A_H && !P_H)
							est_siguiente = S4;
						else if(G && A_H && P_H)
							est_siguiente = S5;
						else
							begin
							est_siguiente = S2;
							
							
							
								L_AH = 1;
								L_PH = 1;
								L_G = 0;
								
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco	     
								sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b01001000111;	//2
								sel_next = L0;
								end
							endcase
								
						end
					end
				
				S3:
					begin
						if (G && A_H && !P_H) 
							est_siguiente = S4;
						else if(!G && !A_H && !P_H)
							est_siguiente = S0;
						else if(A_H && !P_H && !G) 
							est_siguiente = S1;
						else if(A_H && P_H && !G) 
							est_siguiente = S2;
						else if(G && A_H && P_H)
							est_siguiente = S5;
						else
							begin
							est_siguiente = S3;
							
							
							
								L_AH = 0;
								L_PH = 0;
								L_G = 1;
						
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco
								sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b01100000111;	//3
								sel_next = L0;
								end
							endcase
						end
					end
				
				S4:
					begin
						if (G && A_H && P_H) 
							est_siguiente = S5;
						else if(!G && !A_H && !P_H)
							est_siguiente = S0;
						else if(A_H && !P_H && !G) 
							est_siguiente = S1;
						else if(A_H && P_H && !G) 
							est_siguiente = S2;
						else if(G && !A_H && !P_H)
							est_siguiente = S3;
						else
							begin
							est_siguiente = S4;
							
							
							
								L_AH = 1;
								L_PH = 0;
								L_G = 1;
								
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco	
								sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b00110010111;	//4
								sel_next = L0;
								end
							endcase
						end
					end
				
				S5:
					begin
						if (A_H && !P_H && !G) 
							est_siguiente = S1;
						else if(!G && !A_H && !P_H)
							est_siguiente = S0;
						else if(A_H && P_H && !G) 
							est_siguiente = S2;
						else if(G && !A_H && !P_H)
							est_siguiente = S3;
						else if(G && A_H && !P_H)
							est_siguiente = S4;
						else
							begin
							est_siguiente = S5;
							
							
							
								L_AH = 1;
								L_PH = 1;
								L_G = 1;
								
								case(sel)
								L0:
								begin
								sseg  = 11'b00100101110;  	//S
								sel_next = L1;
								end
								L1:
								begin
								sseg  = 11'b11111111101;  	//blanco	   
								sel_next = L2;
								end
								L2:
								begin
								sseg  = 11'b11111111011;	//blanco
								sel_next = L3;
								end
								L3:
								begin
								sseg  = 11'b00100100111;	//5
								sel_next = L0;
								end
							endcase
						end
					end
		endcase
		end
	
endmodule
