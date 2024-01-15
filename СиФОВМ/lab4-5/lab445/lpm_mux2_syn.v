// megafunction wizard: %LPM_MUX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_mux 

// ============================================================
// File Name: lpm_mux2.v
// Megafunction Name(s):
// 			lpm_mux
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 222 10/21/2009 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//lpm_mux DEVICE_FAMILY="Stratix II" LPM_SIZE=5 LPM_WIDTH=10 LPM_WIDTHS=3 data result sel
//VERSION_BEGIN 9.1 cbx_lpm_mux 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = lut 24 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_mux2_mux
	( 
	data,
	result,
	sel) /* synthesis synthesis_clearbox=1 */;
	input   [49:0]  data;
	output   [9:0]  result;
	input   [2:0]  sel;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [49:0]  data;
	tri0   [2:0]  sel;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire	wire_l1_w0_n0_mux_dataout;
	wire	wire_l1_w0_n1_mux_dataout;
	wire	wire_l1_w0_n2_mux_dataout;
	wire	wire_l1_w0_n3_mux_dataout;
	wire	wire_l1_w1_n0_mux_dataout;
	wire	wire_l1_w1_n1_mux_dataout;
	wire	wire_l1_w1_n2_mux_dataout;
	wire	wire_l1_w1_n3_mux_dataout;
	wire	wire_l1_w2_n0_mux_dataout;
	wire	wire_l1_w2_n1_mux_dataout;
	wire	wire_l1_w2_n2_mux_dataout;
	wire	wire_l1_w2_n3_mux_dataout;
	wire	wire_l1_w3_n0_mux_dataout;
	wire	wire_l1_w3_n1_mux_dataout;
	wire	wire_l1_w3_n2_mux_dataout;
	wire	wire_l1_w3_n3_mux_dataout;
	wire	wire_l1_w4_n0_mux_dataout;
	wire	wire_l1_w4_n1_mux_dataout;
	wire	wire_l1_w4_n2_mux_dataout;
	wire	wire_l1_w4_n3_mux_dataout;
	wire	wire_l1_w5_n0_mux_dataout;
	wire	wire_l1_w5_n1_mux_dataout;
	wire	wire_l1_w5_n2_mux_dataout;
	wire	wire_l1_w5_n3_mux_dataout;
	wire	wire_l1_w6_n0_mux_dataout;
	wire	wire_l1_w6_n1_mux_dataout;
	wire	wire_l1_w6_n2_mux_dataout;
	wire	wire_l1_w6_n3_mux_dataout;
	wire	wire_l1_w7_n0_mux_dataout;
	wire	wire_l1_w7_n1_mux_dataout;
	wire	wire_l1_w7_n2_mux_dataout;
	wire	wire_l1_w7_n3_mux_dataout;
	wire	wire_l1_w8_n0_mux_dataout;
	wire	wire_l1_w8_n1_mux_dataout;
	wire	wire_l1_w8_n2_mux_dataout;
	wire	wire_l1_w8_n3_mux_dataout;
	wire	wire_l1_w9_n0_mux_dataout;
	wire	wire_l1_w9_n1_mux_dataout;
	wire	wire_l1_w9_n2_mux_dataout;
	wire	wire_l1_w9_n3_mux_dataout;
	wire	wire_l2_w0_n0_mux_dataout;
	wire	wire_l2_w0_n1_mux_dataout;
	wire	wire_l2_w1_n0_mux_dataout;
	wire	wire_l2_w1_n1_mux_dataout;
	wire	wire_l2_w2_n0_mux_dataout;
	wire	wire_l2_w2_n1_mux_dataout;
	wire	wire_l2_w3_n0_mux_dataout;
	wire	wire_l2_w3_n1_mux_dataout;
	wire	wire_l2_w4_n0_mux_dataout;
	wire	wire_l2_w4_n1_mux_dataout;
	wire	wire_l2_w5_n0_mux_dataout;
	wire	wire_l2_w5_n1_mux_dataout;
	wire	wire_l2_w6_n0_mux_dataout;
	wire	wire_l2_w6_n1_mux_dataout;
	wire	wire_l2_w7_n0_mux_dataout;
	wire	wire_l2_w7_n1_mux_dataout;
	wire	wire_l2_w8_n0_mux_dataout;
	wire	wire_l2_w8_n1_mux_dataout;
	wire	wire_l2_w9_n0_mux_dataout;
	wire	wire_l2_w9_n1_mux_dataout;
	wire	wire_l3_w0_n0_mux_dataout;
	wire	wire_l3_w1_n0_mux_dataout;
	wire	wire_l3_w2_n0_mux_dataout;
	wire	wire_l3_w3_n0_mux_dataout;
	wire	wire_l3_w4_n0_mux_dataout;
	wire	wire_l3_w5_n0_mux_dataout;
	wire	wire_l3_w6_n0_mux_dataout;
	wire	wire_l3_w7_n0_mux_dataout;
	wire	wire_l3_w8_n0_mux_dataout;
	wire	wire_l3_w9_n0_mux_dataout;
	wire  [139:0]  data_wire;
	wire  [9:0]  result_wire_ext;
	wire  [8:0]  sel_wire;

	assign		wire_l1_w0_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[10] : data_wire[0];
	assign		wire_l1_w0_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[30] : data_wire[20];
	assign		wire_l1_w0_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[50] : data_wire[40];
	assign		wire_l1_w0_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[70] : data_wire[60];
	assign		wire_l1_w1_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[11] : data_wire[1];
	assign		wire_l1_w1_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[31] : data_wire[21];
	assign		wire_l1_w1_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[51] : data_wire[41];
	assign		wire_l1_w1_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[71] : data_wire[61];
	assign		wire_l1_w2_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[12] : data_wire[2];
	assign		wire_l1_w2_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[32] : data_wire[22];
	assign		wire_l1_w2_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[52] : data_wire[42];
	assign		wire_l1_w2_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[72] : data_wire[62];
	assign		wire_l1_w3_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[13] : data_wire[3];
	assign		wire_l1_w3_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[33] : data_wire[23];
	assign		wire_l1_w3_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[53] : data_wire[43];
	assign		wire_l1_w3_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[73] : data_wire[63];
	assign		wire_l1_w4_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[14] : data_wire[4];
	assign		wire_l1_w4_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[34] : data_wire[24];
	assign		wire_l1_w4_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[54] : data_wire[44];
	assign		wire_l1_w4_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[74] : data_wire[64];
	assign		wire_l1_w5_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[15] : data_wire[5];
	assign		wire_l1_w5_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[35] : data_wire[25];
	assign		wire_l1_w5_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[55] : data_wire[45];
	assign		wire_l1_w5_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[75] : data_wire[65];
	assign		wire_l1_w6_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[16] : data_wire[6];
	assign		wire_l1_w6_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[36] : data_wire[26];
	assign		wire_l1_w6_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[56] : data_wire[46];
	assign		wire_l1_w6_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[76] : data_wire[66];
	assign		wire_l1_w7_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[17] : data_wire[7];
	assign		wire_l1_w7_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[37] : data_wire[27];
	assign		wire_l1_w7_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[57] : data_wire[47];
	assign		wire_l1_w7_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[77] : data_wire[67];
	assign		wire_l1_w8_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[18] : data_wire[8];
	assign		wire_l1_w8_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[38] : data_wire[28];
	assign		wire_l1_w8_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[58] : data_wire[48];
	assign		wire_l1_w8_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[78] : data_wire[68];
	assign		wire_l1_w9_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[19] : data_wire[9];
	assign		wire_l1_w9_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[39] : data_wire[29];
	assign		wire_l1_w9_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[59] : data_wire[49];
	assign		wire_l1_w9_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[79] : data_wire[69];
	assign		wire_l2_w0_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[81] : data_wire[80];
	assign		wire_l2_w0_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[83] : data_wire[82];
	assign		wire_l2_w1_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[85] : data_wire[84];
	assign		wire_l2_w1_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[87] : data_wire[86];
	assign		wire_l2_w2_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[89] : data_wire[88];
	assign		wire_l2_w2_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[91] : data_wire[90];
	assign		wire_l2_w3_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[93] : data_wire[92];
	assign		wire_l2_w3_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[95] : data_wire[94];
	assign		wire_l2_w4_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[97] : data_wire[96];
	assign		wire_l2_w4_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[99] : data_wire[98];
	assign		wire_l2_w5_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[101] : data_wire[100];
	assign		wire_l2_w5_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[103] : data_wire[102];
	assign		wire_l2_w6_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[105] : data_wire[104];
	assign		wire_l2_w6_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[107] : data_wire[106];
	assign		wire_l2_w7_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[109] : data_wire[108];
	assign		wire_l2_w7_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[111] : data_wire[110];
	assign		wire_l2_w8_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[113] : data_wire[112];
	assign		wire_l2_w8_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[115] : data_wire[114];
	assign		wire_l2_w9_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[117] : data_wire[116];
	assign		wire_l2_w9_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[119] : data_wire[118];
	assign		wire_l3_w0_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[121] : data_wire[120];
	assign		wire_l3_w1_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[123] : data_wire[122];
	assign		wire_l3_w2_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[125] : data_wire[124];
	assign		wire_l3_w3_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[127] : data_wire[126];
	assign		wire_l3_w4_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[129] : data_wire[128];
	assign		wire_l3_w5_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[131] : data_wire[130];
	assign		wire_l3_w6_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[133] : data_wire[132];
	assign		wire_l3_w7_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[135] : data_wire[134];
	assign		wire_l3_w8_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[137] : data_wire[136];
	assign		wire_l3_w9_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[139] : data_wire[138];
	assign
		data_wire = {wire_l2_w9_n1_mux_dataout, wire_l2_w9_n0_mux_dataout, wire_l2_w8_n1_mux_dataout, wire_l2_w8_n0_mux_dataout, wire_l2_w7_n1_mux_dataout, wire_l2_w7_n0_mux_dataout, wire_l2_w6_n1_mux_dataout, wire_l2_w6_n0_mux_dataout, wire_l2_w5_n1_mux_dataout, wire_l2_w5_n0_mux_dataout, wire_l2_w4_n1_mux_dataout, wire_l2_w4_n0_mux_dataout, wire_l2_w3_n1_mux_dataout, wire_l2_w3_n0_mux_dataout, wire_l2_w2_n1_mux_dataout, wire_l2_w2_n0_mux_dataout, wire_l2_w1_n1_mux_dataout, wire_l2_w1_n0_mux_dataout, wire_l2_w0_n1_mux_dataout, wire_l2_w0_n0_mux_dataout, wire_l1_w9_n3_mux_dataout, wire_l1_w9_n2_mux_dataout, wire_l1_w9_n1_mux_dataout, wire_l1_w9_n0_mux_dataout, wire_l1_w8_n3_mux_dataout, wire_l1_w8_n2_mux_dataout, wire_l1_w8_n1_mux_dataout, wire_l1_w8_n0_mux_dataout, wire_l1_w7_n3_mux_dataout, wire_l1_w7_n2_mux_dataout, wire_l1_w7_n1_mux_dataout, wire_l1_w7_n0_mux_dataout, wire_l1_w6_n3_mux_dataout, wire_l1_w6_n2_mux_dataout, wire_l1_w6_n1_mux_dataout, wire_l1_w6_n0_mux_dataout, wire_l1_w5_n3_mux_dataout, wire_l1_w5_n2_mux_dataout, wire_l1_w5_n1_mux_dataout, wire_l1_w5_n0_mux_dataout, wire_l1_w4_n3_mux_dataout, wire_l1_w4_n2_mux_dataout, wire_l1_w4_n1_mux_dataout, wire_l1_w4_n0_mux_dataout, wire_l1_w3_n3_mux_dataout, wire_l1_w3_n2_mux_dataout, wire_l1_w3_n1_mux_dataout, wire_l1_w3_n0_mux_dataout, wire_l1_w2_n3_mux_dataout, wire_l1_w2_n2_mux_dataout, wire_l1_w2_n1_mux_dataout, wire_l1_w2_n0_mux_dataout, wire_l1_w1_n3_mux_dataout, wire_l1_w1_n2_mux_dataout, wire_l1_w1_n1_mux_dataout, wire_l1_w1_n0_mux_dataout, wire_l1_w0_n3_mux_dataout, wire_l1_w0_n2_mux_dataout, wire_l1_w0_n1_mux_dataout, wire_l1_w0_n0_mux_dataout, {30{1'b0}}, data},
		result = result_wire_ext,
		result_wire_ext = {wire_l3_w9_n0_mux_dataout, wire_l3_w8_n0_mux_dataout, wire_l3_w7_n0_mux_dataout, wire_l3_w6_n0_mux_dataout, wire_l3_w5_n0_mux_dataout, wire_l3_w4_n0_mux_dataout, wire_l3_w3_n0_mux_dataout, wire_l3_w2_n0_mux_dataout, wire_l3_w1_n0_mux_dataout, wire_l3_w0_n0_mux_dataout},
		sel_wire = {sel[2], {3{1'b0}}, sel[1], {3{1'b0}}, sel[0]};
endmodule //lpm_mux2_mux
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module lpm_mux2 (
	data0x,
	data1x,
	data2x,
	data3x,
	data4x,
	sel,
	result)/* synthesis synthesis_clearbox = 1 */;

	input	[9:0]  data0x;
	input	[9:0]  data1x;
	input	[9:0]  data2x;
	input	[9:0]  data3x;
	input	[9:0]  data4x;
	input	[2:0]  sel;
	output	[9:0]  result;

	wire [9:0] sub_wire0;
	wire [9:0] sub_wire6 = data0x[9:0];
	wire [9:0] sub_wire5 = data1x[9:0];
	wire [9:0] sub_wire4 = data2x[9:0];
	wire [9:0] sub_wire3 = data3x[9:0];
	wire [9:0] result = sub_wire0[9:0];
	wire [9:0] sub_wire1 = data4x[9:0];
	wire [49:0] sub_wire2 = {sub_wire6, sub_wire5, sub_wire4, sub_wire3, sub_wire1};

	lpm_mux2_mux	lpm_mux2_mux_component (
				.sel (sel),
				.data (sub_wire2),
				.result (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "5"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "10"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "3"
// Retrieval info: USED_PORT: data0x 0 0 10 0 INPUT NODEFVAL data0x[9..0]
// Retrieval info: USED_PORT: data1x 0 0 10 0 INPUT NODEFVAL data1x[9..0]
// Retrieval info: USED_PORT: data2x 0 0 10 0 INPUT NODEFVAL data2x[9..0]
// Retrieval info: USED_PORT: data3x 0 0 10 0 INPUT NODEFVAL data3x[9..0]
// Retrieval info: USED_PORT: data4x 0 0 10 0 INPUT NODEFVAL data4x[9..0]
// Retrieval info: USED_PORT: result 0 0 10 0 OUTPUT NODEFVAL result[9..0]
// Retrieval info: USED_PORT: sel 0 0 3 0 INPUT NODEFVAL sel[2..0]
// Retrieval info: CONNECT: result 0 0 10 0 @result 0 0 10 0
// Retrieval info: CONNECT: @data 1 4 10 0 data4x 0 0 10 0
// Retrieval info: CONNECT: @data 1 3 10 0 data3x 0 0 10 0
// Retrieval info: CONNECT: @data 1 2 10 0 data2x 0 0 10 0
// Retrieval info: CONNECT: @data 1 1 10 0 data1x 0 0 10 0
// Retrieval info: CONNECT: @data 1 0 10 0 data0x 0 0 10 0
// Retrieval info: CONNECT: @sel 0 0 3 0 sel 0 0 3 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2.tdf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2_inst.tdf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_mux2_syn.v TRUE
// Retrieval info: LIB_FILE: lpm
