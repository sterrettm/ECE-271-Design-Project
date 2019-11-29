module inputTypeDisplay(input logic [1:0] sel,
								output logic [6:0] seg0, seg1, seg2,
								output logic [6:0] seg3, seg4, seg5);
								
	// NES 7-segment values
	logic [6:0] nes0 = 7'b100_1000;
	logic [6:0] nes1 = 7'b000_0110;
	logic [6:0] nes2 = 7'b001_0010;
	
	// SNES 7-segment values
	logic [6:0] snes0 = 7'b001_0010;
	logic [6:0] snes1 = 7'b100_1000;
	logic [6:0] snes2 = 7'b000_0110;
	logic [6:0] snes3 = 7'b001_0010;
	
	// empty 7-segment value
	logic [6:0] empty = 7'b111_1111;
	
	always_comb
		if 		(sel == 2'b00)
			begin
				seg0 <= nes0;
				seg1 <= nes1;
				seg2 <= nes2;
				seg3 <= empty;
				seg4 <= empty;
				seg5 <= empty;
			end
		else if 	(sel == 2'b01)
			begin
				seg0 <= snes0;
				seg1 <= snes1;
				seg2 <= snes2;
				seg3 <= snes3;
				seg4 <= empty;
				seg5 <= empty;
			end
		else
			begin
				seg0 <= empty;
				seg1 <= empty;
				seg2 <= empty;
				seg3 <= empty;
				seg4 <= empty;
				seg5 <= empty;
			end
			
endmodule 