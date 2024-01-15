// megafunction wizard: %LPM_COUNTER%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_counter 

// ============================================================
// File Name: lpm_counter1.v
// Megafunction Name(s):
// 			lpm_counter
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


//lpm_counter DEVICE_FAMILY="Stratix II" lpm_direction="UP" lpm_port_updown="PORT_UNUSED" lpm_width=8 aload clock data q
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_lpm_counter 2009:10:21:21:22:16:SJ cbx_lpm_decode 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = lut 8 reg 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_counter1_cntr
	( 
	aload,
	clock,
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   aload;
	input   clock;
	input   [7:0]  data;
	output   [7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aload;
	tri0   [7:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire  [0:0]   wire_counter_comb_bita_5cout;
	wire  [0:0]   wire_counter_comb_bita_6cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [0:0]   wire_counter_comb_bita_2sumout;
	wire  [0:0]   wire_counter_comb_bita_3sumout;
	wire  [0:0]   wire_counter_comb_bita_4sumout;
	wire  [0:0]   wire_counter_comb_bita_5sumout;
	wire  [0:0]   wire_counter_comb_bita_6sumout;
	wire  [0:0]   wire_counter_comb_bita_7sumout;
	wire  [7:0]   wire_counter_reg_bit1a_adatasdata;
	wire  [7:0]   wire_counter_reg_bit1a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire cnt_en;
	wire  external_cin;
	wire  lsb_cin;
	wire  [7:0]  safe_q;
	wire sclr;
	wire sload;
	wire sset;
	wire  updown_dir;
	wire  updown_lsb;
	wire  updown_other_bits;

	stratixii_lcell_comb   counter_comb_bita_0
	( 
	.cin(lsb_cin),
	.combout(),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[0:0]),
	.dataf(updown_lsb),
	.shareout(),
	.sumout(wire_counter_comb_bita_0sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_0.extended_lut = "off",
		counter_comb_bita_0.lut_mask = 64'h000000000000FF00,
		counter_comb_bita_0.shared_arith = "off",
		counter_comb_bita_0.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[1:1]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_1sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_1.extended_lut = "off",
		counter_comb_bita_1.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_1.shared_arith = "off",
		counter_comb_bita_1.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[2:2]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_2sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_2.extended_lut = "off",
		counter_comb_bita_2.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_2.shared_arith = "off",
		counter_comb_bita_2.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[3:3]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_3sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_3.extended_lut = "off",
		counter_comb_bita_3.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_3.shared_arith = "off",
		counter_comb_bita_3.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[4:4]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_4sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_4.extended_lut = "off",
		counter_comb_bita_4.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_4.shared_arith = "off",
		counter_comb_bita_4.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_5cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[5:5]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_5sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_5.extended_lut = "off",
		counter_comb_bita_5.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_5.shared_arith = "off",
		counter_comb_bita_5.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_6
	( 
	.cin(wire_counter_comb_bita_5cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_6cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[6:6]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_6sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_6.extended_lut = "off",
		counter_comb_bita_6.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_6.shared_arith = "off",
		counter_comb_bita_6.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_7
	( 
	.cin(wire_counter_comb_bita_6cout[0:0]),
	.combout(),
	.cout(),
	.datad(wire_counter_reg_bit1a_regout[7:7]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_7sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_7.extended_lut = "off",
		counter_comb_bita_7.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_7.shared_arith = "off",
		counter_comb_bita_7.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit1a_0
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[0:0]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[0:0]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_1
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[1:1]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[1:1]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_2
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[2:2]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_2sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[2:2]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_3
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[3:3]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_3sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[3:3]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_4
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[4:4]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_4sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[4:4]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_5
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[5:5]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_5sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[5:5]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_6
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[6:6]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_6sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[6:6]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_7
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[7:7]),
	.aload(aload),
	.clk(clock),
	.datain(wire_counter_comb_bita_7sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[7:7]),
	.sclr(sclr),
	.sload(sload)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		wire_counter_reg_bit1a_adatasdata = data;
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		cnt_en = 1'b1,
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		q = safe_q,
		safe_q = wire_counter_reg_bit1a_regout,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b1,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule //lpm_counter1_cntr
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module lpm_counter1 (
	aload,
	clock,
	data,
	q)/* synthesis synthesis_clearbox = 1 */;

	input	  aload;
	input	  clock;
	input	[7:0]  data;
	output	[7:0]  q;

	wire [7:0] sub_wire0;
	wire [7:0] q = sub_wire0[7:0];

	lpm_counter1_cntr	lpm_counter1_cntr_component (
				.aload (aload),
				.clock (clock),
				.data (data),
				.q (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "0"
// Retrieval info: PRIVATE: ALOAD NUMERIC "1"
// Retrieval info: PRIVATE: ASET NUMERIC "0"
// Retrieval info: PRIVATE: ASET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: CLK_EN NUMERIC "0"
// Retrieval info: PRIVATE: CNT_EN NUMERIC "0"
// Retrieval info: PRIVATE: CarryIn NUMERIC "0"
// Retrieval info: PRIVATE: CarryOut NUMERIC "0"
// Retrieval info: PRIVATE: Direction NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: ModulusCounter NUMERIC "0"
// Retrieval info: PRIVATE: ModulusValue NUMERIC "0"
// Retrieval info: PRIVATE: SCLR NUMERIC "0"
// Retrieval info: PRIVATE: SLOAD NUMERIC "0"
// Retrieval info: PRIVATE: SSET NUMERIC "0"
// Retrieval info: PRIVATE: SSET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: nBit NUMERIC "8"
// Retrieval info: CONSTANT: LPM_DIRECTION STRING "UP"
// Retrieval info: CONSTANT: LPM_PORT_UPDOWN STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COUNTER"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "8"
// Retrieval info: USED_PORT: aload 0 0 0 0 INPUT NODEFVAL aload
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: data 0 0 8 0 INPUT NODEFVAL data[7..0]
// Retrieval info: USED_PORT: q 0 0 8 0 OUTPUT NODEFVAL q[7..0]
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: q 0 0 8 0 @q 0 0 8 0
// Retrieval info: CONNECT: @aload 0 0 0 0 aload 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 8 0 data 0 0 8 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1.tdf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1_inst.tdf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1_wave*.jpg TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_counter1_syn.v TRUE
// Retrieval info: LIB_FILE: lpm
