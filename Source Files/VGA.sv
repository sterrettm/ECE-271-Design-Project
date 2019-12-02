/*

	VGA adapter module

*/

module VGAAdapter(
input pixel_clock,

output logic [3:0]r_out,
output logic [3:0]g_out,
output logic [3:0]b_out,
input logic  [3:0]r_in,
input logic  [3:0]g_in,
input logic  [3:0]b_in,

output logic h_sync,
output logic v_sync,
output logic [9:0]x_fetch,
output logic [9:0]y_fetch

);

logic h_clock;
logic v_clock;

logic [9:0]h_coord; 
logic [9:0]v_coord;

assign h_clock = pixel_clock;

Counter #(800, 10) h_counter(
.clockin  (h_clock),
.reset    (1'b0),
.z        (h_coord),
.clockout (v_clock)
);

Counter #(525, 10) v_counter(
.clockin  (v_clock),
.reset    (1'b0),
.z        (v_coord)
);

always_ff @(posedge pixel_clock)
begin

	if (h_coord < 640 & v_coord < 480)
	begin
		r_out <= r_in;
		g_out <= g_in;
		b_out <= b_in;
	end
	else
	begin
		r_out <= 4'b0;
		g_out <= 4'b0;
		b_out <= 4'b0;
	end

	if (h_coord >= 656 & h_coord < 752)
	begin
		h_sync <= 1'b0;
	end
	else
	begin
		h_sync <= 1'b1;
	end
	
	if (v_coord >= 490 & v_coord < 492)
	begin
		v_sync <= 1'b0;
	end
	else
	begin
		v_sync <= 1'b1;
	end

	x_fetch <= h_coord;
	y_fetch <= v_coord;
	
	
end

endmodule

/*

	VGA register module

*/


module VGARegister(
	input clock, write,
	input  [5:0] x_next, y_next, x_write, y_write,
	output [3:0] r_out, g_out, b_out,
	input  [2:0] r_write, g_write, b_write
);

`include "DISPLAY_PARAMS.sv_params"

logic [8:0]color_out, colorbits;

logic [11:0]addr, write_addr;

logic [WIDTH * HEIGHT * COLORBITS - 1 : 0] frame_buffer;

genvar iX, iY;
generate
for (iX = 0; iX < WIDTH; iX++) begin: outerloop
	for (iY = 0; iY < HEIGHT; iY++) begin: innerloop
		always_ff @(posedge clock)
		begin
			color_out <= ((iX + iY * WIDTH == addr) ? (frame_buffer[addr * COLORBITS +: COLORBITS]) : ({COLORBITS{1'bz}}));
		end
	end
end
endgenerate

/*

	On these two generate statements (above and below):
	
	This is a optimization; what I really want is to look up part of a bus based
	on an address. However, the default way Quartus synthesizes this uses too many
	logic elements and therefore cannot be used with larger frame buffers. These
	generate statements are the result of my trying to optimize reading and writing
	from the frame buffer

*/

genvar i;
generate

for (i = 0; i < WIDTH * HEIGHT; i++) begin: loop

	always_ff @(posedge clock)
	begin
		if (write && i == write_addr)
		begin
			frame_buffer[i * COLORBITS +: COLORBITS] <= colorbits;
		end
	end
	
end
endgenerate


always_comb
begin
	r_out[3:1] = color_out[2:0];
	g_out[3:1] = color_out[5:3];
	b_out[3:1] = color_out[8:6];
	
	r_out[0]   = r_out[3];
	g_out[0]   = g_out[3];
	b_out[0]   = b_out[3];
	
	addr = x_next + y_next * WIDTH;
	write_addr = x_write + y_write * WIDTH;
	colorbits = {b_write, g_write, r_write};
end

endmodule

