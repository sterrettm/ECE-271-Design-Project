module inputTypeDisplay(input logic [1:0] sel,
								output logic [6:0] Seg0, Seg1, Seg2,
								output logic [6:0] Seg3, Seg4, Seg5);
								
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
				Seg0 <= nes0;
				Seg1 <= nes1;
				Seg2 <= nes2;
				Seg3 <= empty;
				Seg4 <= empty;
				Seg5 <= empty;
			end
		else if 	(sel == 2'b01)
			begin
				Seg0 <= snes0;
				Seg1 <= snes1;
				Seg2 <= snes2;
				Seg3 <= snes3;
				Seg4 <= empty;
				Seg5 <= empty;
			end
		else
			begin
				Seg0 <= empty;
				Seg1 <= empty;
				Seg2 <= empty;
				Seg3 <= empty;
				Seg4 <= empty;
				Seg5 <= empty;
			end
			
endmodule 