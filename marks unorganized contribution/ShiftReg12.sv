module ShiftReg12#(parameter N = 12)
						(input logic				clk,
						 input logic				reset, load,
						 input logic				sin,
						 input logic [N-1:0] 	d,
						 output logic [N-1:0] 	q,
						 output logic				sout);
						 
	always_ff@(posedge load, posedge reset, posedge clk)
		if (reset)		q <= 0;
		else if (load) q <= d;
		else				q <= {q[N-2:0], sin};
		
	assign sout = q[N-1];
endmodule