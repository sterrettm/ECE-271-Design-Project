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
// CREATED		"Thu Dec 05 22:58:25 2019"

module designproject(
	clk_10MHz,
	reset,
	next,
	nes_data_in,
	snes_data_in,
	clk_50MHz,
	sw,
	v_sync,
	h_sync,
	nes_clk_latch,
	nes_clk_data,
	snes_clk_latch,
	snes_clk_data,
	b,
	btns,
	g,
	r,
	Seg0,
	Seg1,
	Seg2,
	Seg3,
	Seg4,
	Seg5
);


input wire	clk_10MHz;
input wire	reset;
input wire	next;
input wire	nes_data_in;
input wire	snes_data_in;
input wire	clk_50MHz;
input wire	[8:0] sw;
output wire	v_sync;
output wire	h_sync;
output wire	nes_clk_latch;
output wire	nes_clk_data;
output wire	snes_clk_latch;
output wire	snes_clk_data;
output wire	[3:0] b;
output wire	[11:0] btns;
output wire	[3:0] g;
output wire	[3:0] r;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;
output wire	[6:0] Seg5;

wire	[11:0] btns_ALTERA_SYNTHESIZED;
wire	next_n;
wire	reset_n;
wire	SYNTHESIZED_WIRE_0;
wire	[1:0] SYNTHESIZED_WIRE_9;
wire	[11:0] SYNTHESIZED_WIRE_2;
wire	[11:0] SYNTHESIZED_WIRE_3;
wire	[0:11] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_6;
wire	[5:0] SYNTHESIZED_WIRE_7;
wire	[5:0] SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_4 = 0;




snesdecoder	b2v_inst(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.data_in(snes_data_in),
	.clk_latch(snes_clk_latch),
	.clk_data(snes_clk_data),
	.btn(SYNTHESIZED_WIRE_3));



Counter	b2v_inst10(
	.clockin(clk_50MHz),
	.reset(SYNTHESIZED_WIRE_0),
	.clockout(SYNTHESIZED_WIRE_6)
	);
	defparam	b2v_inst10.FACTOR = 2;
	defparam	b2v_inst10.OUTBITS = 1;


assign	next_n =  ~next;


nesdecoder	b2v_inst2(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.data_in(nes_data_in),
	.clk_latch(nes_clk_latch),
	.clk_data(nes_clk_data),
	.btn(SYNTHESIZED_WIRE_2));


inputselect	b2v_inst3(
	.clk(clk_10MHz),
	.next(next_n),
	.reset(reset_n),
	.sel(SYNTHESIZED_WIRE_9));


CursorController	b2v_inst4(
	.clock50MHz(clk_50MHz),
	.left(btns_ALTERA_SYNTHESIZED[4]),
	.right(btns_ALTERA_SYNTHESIZED[5]),
	.up(btns_ALTERA_SYNTHESIZED[2]),
	.down(btns_ALTERA_SYNTHESIZED[3]),
	.x_cursor(SYNTHESIZED_WIRE_7),
	.y_cursor(SYNTHESIZED_WIRE_8));


inputTypeDisplay	b2v_inst5(
	.sel(SYNTHESIZED_WIRE_9),
	.Seg0(Seg0),
	.Seg1(Seg1),
	.Seg2(Seg2),
	.Seg3(Seg3),
	.Seg4(Seg4),
	.Seg5(Seg5));


mux2	b2v_inst6(
	.a(SYNTHESIZED_WIRE_2),
	.b(SYNTHESIZED_WIRE_3),
	.c(SYNTHESIZED_WIRE_4),
	.sel(SYNTHESIZED_WIRE_9),
	.q(btns_ALTERA_SYNTHESIZED));
	defparam	b2v_inst6.N = 12;


DisplayController	b2v_inst7(
	.clock50MHz(clk_50MHz),
	.clock25MHz(SYNTHESIZED_WIRE_6),
	.write(btns_ALTERA_SYNTHESIZED[0]),
	.b_write(sw[8:6]),
	.g_write(sw[5:3]),
	.r_write(sw[2:0]),
	.x_cursor(SYNTHESIZED_WIRE_7),
	.y_cursor(SYNTHESIZED_WIRE_8),
	.h_sync(h_sync),
	.v_sync(v_sync),
	.b(b),
	.g(g),
	.r(r));

assign	reset_n =  ~reset;

assign	btns = btns_ALTERA_SYNTHESIZED;

endmodule
