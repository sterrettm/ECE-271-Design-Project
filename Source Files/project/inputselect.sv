module inputselect (	input logic clk,
							input logic next,
							input logic reset,
							output logic [1:0] sel);
	
	logic [1:0] state;
	
	always_ff@(posedge next)
		state <= state + 2'b01;
	
	sync sync_1 (
	.clk(clk),
	.d(state),
	.q(sel)
	);
		
endmodule