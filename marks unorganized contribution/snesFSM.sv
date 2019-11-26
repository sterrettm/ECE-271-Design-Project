module snesFSM (input logic clk_10MHz,
				input logic clk_30Hz,
				input logic reset,
				output logic Latch,
				output logic done,
				output logic clk_data);
				
	logic [7:0]	data_pulse_count;
	logic reset_count;
	logic	clk_count;
						
	typedef enum logic [1:0] {A, B, C, D} estate;
	estate state;
	estate nextState;
	
	assign help = state;
	
	always_ff@(posedge clk_10MHz, posedge clk_30Hz, posedge reset)
		if (reset | clk_30Hz)	state = A;
		else state = nextState;
			
	always_comb
	
		case(state)
		
			A:	nextState = B;
					
			B:	nextState = C;
			
			C:	if(data_pulse_count > 8'b0000_1011)	nextState = D;
				else 	nextState = B;
				
			D:	nextState = D;
			
			default: nextState = A;
			
		endcase
		
	assign clk_data = (state == B);
	assign Latch = (state == A);
	assign reset_count = (state == D | reset);
	assign done = (state == D | reset);
	
	assign clk_count = (state == B);
	
	counter datacount(
		.clk(clk_count),
		.reset(reset_count),
		.q(data_pulse_count)
	);
		
	
endmodule