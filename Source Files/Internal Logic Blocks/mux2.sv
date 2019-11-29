module mux2#(parameter N=12)
				(input logic [1:0] sel,
				 input logic [N-1:0] a,
				 input logic [N-1:0] b,
				 input logic [N-1:0] c,
				 output logic [N-1:0] q);
				 
	always_comb
		if (sel == 2'b00)			q <= a;
		else if (sel == 2'b01)	q <= b;
		else if (sel == 2'b10)	q <= c;
		else							q <= 12'b0000_0000_0000;
		
endmodule