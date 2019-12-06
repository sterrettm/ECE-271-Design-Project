module comparator #(parameter N=8)
						(input logic [N-1:0] a, b,
						 output logic gt);
	
	assign gt = (a > b);
	
endmodule