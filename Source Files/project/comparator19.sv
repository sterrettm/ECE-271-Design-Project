module comparator19 #(parameter N=19)
						(input logic [N-1:0] a,
						 output logic gt);
	
	assign gt = (a > 19'b101_0001_0110_0001_0101);
	
endmodule