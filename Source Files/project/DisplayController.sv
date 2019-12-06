module DisplayController(

output logic [3:0]r,g,b,
output logic  h_sync, v_sync,

input clock50MHz,
input clock25MHz,

input logic [5:0] x_cursor, y_cursor,
input logic write,
input logic [2:0] r_write, g_write, b_write


);

`include "DISPLAY_PARAMS.sv_params"

logic [9:0]x_next, y_next;
logic [5:0]x_next_norm, y_next_norm;
logic [8:0]writecolorbits;
logic [3:0]r_next, g_next, b_next, r_in, g_in, b_in;
logic clock1Hz, cursor_on;

ColorController colorcontroller(
.clock50MHz  (clock50MHz),
.x_cursor    (x_cursor),
.y_cursor    (y_cursor),
.x_next      (x_next),
.y_next      (y_next),
.x_next_norm (x_next_norm),
.y_next_norm (y_next_norm),
.r_in        (r_in),
.g_in        (g_in),
.b_in        (b_in),
.r_next      (r_next),
.g_next      (g_next),
.b_next      (b_next)
);

VGARegister register(
.clock     (clock50MHz),
.x_next    (x_next_norm),
.y_next    (y_next_norm),
.x_write   (x_cursor),
.y_write   (y_cursor),
.r_out     (r_next),
.g_out     (g_next),
.b_out     (b_next),
.write     (write),
.r_write   (r_write),
.g_write   (g_write),
.b_write   (b_write)
);


VGAAdapter vga(
.pixel_clock (clock25MHz),
.r_out       (r),
.g_out       (g),
.b_out       (b),
.r_in        (r_in),
.g_in        (g_in),
.b_in        (b_in),

.h_sync      (h_sync),
.v_sync      (v_sync),
.x_fetch     (x_next),
.y_fetch     (y_next)
);

endmodule

module ColorController(
input  logic clock50MHz,
input  logic [9:0] x_next, y_next,
output logic [5:0] x_next_norm, y_next_norm,
input  logic [5:0] x_cursor, y_cursor,
input  logic [3:0] r_next, g_next, b_next,
output logic [3:0] r_in, g_in, b_in
);

`include "DISPLAY_PARAMS.sv_params"

Counter #(50000000, 26) clockslower1hz(
.clockin  (clock50MHz),
.reset    (1'b0),
.clockout (clock1Hz)
);

logic cursor_on;

always_ff @(posedge clock1Hz)
begin
	cursor_on <= ~cursor_on;
end

always_comb
begin
	
	// Quartus seems to understand the bit shift optimizations of these divisions
	x_next_norm = x_next / PIXELSIZE;
	y_next_norm = y_next / PIXELSIZE;
	if (x_next_norm == x_cursor && y_next_norm == y_cursor && cursor_on)
	begin
		r_in = 4'b1111;
		g_in = 4'b1111;
		b_in = 4'b1111;
	end
	else
	begin
		r_in = r_next;
		g_in = g_next;
		b_in = b_next;
	end
	
end

endmodule
