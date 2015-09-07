`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:41 08/30/2015 
// Design Name: 
// Module Name:    Junta1 
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
module Proyect(

input wire CLK_G,
input wire reset_G,
input wire ps2data,
input wire ps2clk,
input wire Rx_en,
output wire [3:0] Temps,
output wire RESETFSM,
output wire Gas, Alerta,Peligro,xD
    );
	 
wire [7:0] Datos;
wire Enable;
wire Bandera;
wire [7:0] Unidades;
wire [7:0] Decenas;

assign xD = Enable;

PS2Reciever instance_InterPs2 (
    .clk(CLK_G), 
    .reset(reset_G), 
    .ps2d(ps2data), 
    .ps2c(ps2clk), 
    .rx_en(Rx_en), 
    .rx_done_tick(Enable), 
    .dout(Datos)
    );

Filtro_Fo instance_Filtro (
    .CLK(CLK_G), 
    .reset(reset_G), 
    .tick(Enable), 
    .din(Datos), 
    .rx_tick(Bandera)
    );

Recep instance_Interpretacion (
    .CLK(CLK_G),
    .flag(Bandera), 
    .Dato(Datos), 
    .STtemp1(Decenas), 
    .STtemp2(Unidades), 
    .STPeligro(Peligro), 
    .STAlerta(Alerta), 
    .STGas(Gas), 
    .Greset(RESETFSM)
    ); 

DecoTemps instance_DecoTemps (
    .CLK(CLK_G), 
    .reset(reset_G), 
    .UNIDADES(Unidades), 
    .DECENAS(Decenas), 
    .TempDecsalida(Temps)
    );

endmodule
