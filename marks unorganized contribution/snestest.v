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
// CREATED		"Mon Nov 25 18:13:19 2019"

module snestest(
	clk_10MHz,
	reset,
	a,
	b,
	up,
	dn,
	lt,
	rt,
	st,
	sel,
	y,
	lb,
	rb,
	x,
	btn
);


input wire	clk_10MHz;
input wire	reset;
input wire	a;
input wire	b;
input wire	up;
input wire	dn;
input wire	lt;
input wire	rt;
input wire	st;
input wire	sel;
input wire	y;
input wire	lb;
input wire	rb;
input wire	x;
output wire	[11:0] btn;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





snesdecoder	b2v_inst(
	.clk_10MHz(clk_10MHz),
	.reset(reset),
	.data_in(SYNTHESIZED_WIRE_0),
	.clk_latch(SYNTHESIZED_WIRE_2),
	.clk_data(SYNTHESIZED_WIRE_1),
	.btn(btn));


snescontroller	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_1),
	.Latch(SYNTHESIZED_WIRE_2),
	.a(a),
	.b(b),
	.up(up),
	.dn(dn),
	.lt(lt),
	.rt(rt),
	.st(st),
	.sel(sel),
	.x(x),
	.y(y),
	.lb(lb),
	.rb(rb),
	.data(SYNTHESIZED_WIRE_0));


endmodule
