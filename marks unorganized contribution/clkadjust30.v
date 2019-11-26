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
// CREATED		"Fri Nov 22 12:11:42 2019"

module clkadjust30(
	clk_10MHz,
	reset,
	clk_30Hz
);


input wire	clk_10MHz;
input wire	reset;
output wire	clk_30Hz;

wire	SYNTHESIZED_WIRE_0;
wire	[18:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;

assign	clk_30Hz = SYNTHESIZED_WIRE_2;




counter19	b2v_inst(
	.clk(clk_10MHz),
	.reset(SYNTHESIZED_WIRE_0),
	.q(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst.N = 19;


comparator19	b2v_inst5(
	.a(SYNTHESIZED_WIRE_1),
	.gt(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst5.N = 19;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 | reset;


sync	b2v_inst7(
	.clk(clk_10MHz),
	.d(SYNTHESIZED_WIRE_3),
	.q(SYNTHESIZED_WIRE_2));


endmodule
