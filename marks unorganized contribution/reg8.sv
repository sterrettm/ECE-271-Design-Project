module reg8(input logic clk,
				input logic [7:0] d,
				output logic [11:0] q);
	
	assign q[11:8] = 0;
	
	always_ff@(posedge clk)
		q[7:0] <= d[7:0];
		
endmodule