module reg12(input logic clk,
				input logic [11:0] d,
				output logic [11:0] q);
	
	always_ff@(posedge clk)
		q <= d;
		
endmodule