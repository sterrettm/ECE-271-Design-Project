module inputseltest (input logic clk_10MHz,
							input logic reset,
							input logic next,
							output logic [6:0] Seg0, Seg1, Seg2, Seg3, Seg4, Seg5);
						
	logic [1:0] selector;
	logic [23:0] count;
	logic clk_slow;
	
	always_ff@(posedge clk_10MHz)
		if (count > 24'b0000_1000_0000_0000_0000_0000)	clk_slow <= 1;
		else								clk_slow <= 0;
					
					
	Counter24 slow (
	.clk(clk_10MHz),
	.reset(reset | clk_slow),
	.q(count)
	);
	
	inputselect inpsel (
	.clk(clk_slow),
	.reset(reset),
	.next(~next),
	.sel(selector)
	);
	
	inputTypeDisplay disp (
	.sel(selector),
	.Seg0(Seg0),
	.Seg1(Seg1),
	.Seg2(Seg2),
	.Seg3(Seg3),
	.Seg4(Seg4),
	.Seg5(Seg5)
	);
	
endmodule

module Counter24 #(N=24) 
					(input logic clk,
					 input logic reset,
					 output logic [N-1:0] q);
					 
	always_ff@(posedge clk, posedge reset)
		if (reset) q <= 0;
		else		  q <= q + 1;
		
endmodule	