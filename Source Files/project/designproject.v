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
// CREATED		"Fri Nov 29 15:14:36 2019"

module designproject(
	next,
	prev,
	clk_10MHz,
	reset,
	btns,
	Seg0,
	Seg1,
	Seg2,
	Seg3,
	Seg4,
	Seg5
);


input wire	next;
input wire	prev;
input wire	clk_10MHz;
input wire	reset;
output wire	[11:0] btns;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;
output wire	[6:0] Seg5;

wire	nes_clk_data;
wire	nes_clk_latch;
wire	nes_data_in;
wire	snes_clk_data;
wire	snes_clk_latch;
wire	snes_data_in;
wire	[1:0] SYNTHESIZED_WIRE_5;
wire	[11:0] SYNTHESIZED_WIRE_1;
wire	[11:0] SYNTHESIZED_WIRE_2;
wire	[0:11] SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 = 0;




snesdecoder	b2v_inst(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.data_in(snes_data_in),
	.clk_latch(snes_clk_latch),
	.clk_data(snes_clk_data),
	.btn(SYNTHESIZED_WIRE_2));



nesdecoder	b2v_inst2(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.data_in(nes_data_in),
	.clk_latch(nes_clk_latch),
	.clk_data(nes_clk_data),
	.btn(SYNTHESIZED_WIRE_1));


inputselect	b2v_inst3(
	.clk(clk_10MHz),
	.next(next),
	.prev(prev),
	.reset(reset),
	.sel(SYNTHESIZED_WIRE_5));


inputTypeDisplay	b2v_inst5(
	.sel(SYNTHESIZED_WIRE_5),
	.seg0(Seg0),
	.seg1(Seg1),
	.seg2(Seg2),
	.seg3(Seg3),
	.seg4(Seg4),
	.seg5(Seg5));


mux2	b2v_inst6(
	.a(SYNTHESIZED_WIRE_1),
	.b(SYNTHESIZED_WIRE_2),
	.c(SYNTHESIZED_WIRE_3),
	.sel(SYNTHESIZED_WIRE_5),
	.q(btns));
	defparam	b2v_inst6.N = 12;


nescontroller	b2v_inst8(
	.clk(nes_clk_data),
	.Latch(nes_clk_latch),
	
	
	
	
	
	
	
	
	.data(nes_data_in));


snescontroller	b2v_inst9(
	.clk(snes_clk_data),
	.Latch(snes_clk_latch),
	
	
	
	
	
	
	
	
	
	
	
	
	.data(snes_data_in));


endmodule
