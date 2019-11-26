module counter19 #(parameter N=19)
					(input logic clk,
					 input logic reset,
					 output logic [N-1:0] q);
					 
	always_ff@(posedge clk)
		if (reset) q <= 0;
		else		  q <= q + 1;
		
endmodule	