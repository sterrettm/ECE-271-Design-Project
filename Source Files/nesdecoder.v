// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Mon Nov 25 19:11:48 2019"

module nesdecoder(
	reset,
	clk_10MHz,
	data_in,
	clk_data,
	clk_latch,
	btn
);


input wire	reset;
input wire	clk_10MHz;
input wire	data_in;
output wire	clk_data;
output wire	clk_latch;
output wire	[11:0] btn;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[0:7] SYNTHESIZED_WIRE_7;

assign	clk_data = SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_6 = 0;
assign	SYNTHESIZED_WIRE_7 = 0;





clkadjust30	b2v_inst(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.clk_30Hz(SYNTHESIZED_WIRE_0));


FSM	b2v_inst1(
	.clk_10MHz(clk_10MHz),
	.clk_30Hz(SYNTHESIZED_WIRE_0),
	.reset(reset),
	.Latch(clk_latch),
	.done(SYNTHESIZED_WIRE_1),
	.clk_data(SYNTHESIZED_WIRE_3));


reg8	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_1),
	.d(SYNTHESIZED_WIRE_2),
	.q(btn));


assign	SYNTHESIZED_WIRE_4 =  ~SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_4;


ShiftReg	b2v_shiftreg(
	.clk(SYNTHESIZED_WIRE_5),
	.reset(reset),
	.load(SYNTHESIZED_WIRE_6),
	.sin(data_in),
	.d(SYNTHESIZED_WIRE_7),
	
	.q(SYNTHESIZED_WIRE_2));
	defparam	b2v_shiftreg.N = 8;


endmodule
