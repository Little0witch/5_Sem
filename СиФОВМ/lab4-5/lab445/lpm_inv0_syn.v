// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus II"
// VERSION "Version 9.1 Build 222 10/21/2009 SJ Web Edition"

// DATE "11/20/2023 02:15:43"

// 
// Device: Altera EP2S15F484C3 Package FBGA484
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module lpm_inv0 (
	data,
	result)/* synthesis synthesis_greybox=0 */;
input 	[9:0] data;
output 	[9:0] result;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



assign result[0] = ~ data[0];

assign result[1] = ~ data[1];

assign result[2] = ~ data[2];

assign result[3] = ~ data[3];

assign result[4] = ~ data[4];

assign result[5] = ~ data[5];

assign result[6] = ~ data[6];

assign result[7] = ~ data[7];

assign result[8] = ~ data[8];

assign result[9] = ~ data[9];

endmodule
