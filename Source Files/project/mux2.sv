module mux2#(parameter N=12)
				(input logic [1:0] sel,
				 input logic [N-1:0] a,
				 input logic [N-1:0] b,
				 input logic [N-1:0] c,
				 output logic [N-1:0] q);
				 
	always_comb
		if (sel == 2'b00)
		begin
			q[0] <= a[7];	//a
			q[1] <= a[6];	//b
			q[2] <= a[3];	//u
			q[3] <= a[2];	//d
			q[4] <= a[1];	//l
			q[5] <= a[0];	//r
			q[6] <= a[4];	//start
			q[7] <= a[5];	//select
			q[11:8] <= 4'b0000;
		end
		else if (sel == 2'b01)
		begin
			q[0] <= b[8];	//a
			q[1] <= b[0];	//b
			q[2] <= b[4];	//u
			q[3] <= b[5];	//d
			q[4] <= b[6];	//l
			q[5] <= b[7];	//r
			q[6] <= b[3];	//start
			q[7] <= b[2];	//select
			q[8] <= b[9];	//x	
			q[9] <= b[1];	//y
			q[10] <= b[10];//lb
			q[11] <= b[11];//rb		
		end
		else if (sel == 2'b10)	q <= c;
		else							q <= 12'b0000_0000_0000;
		
endmodule