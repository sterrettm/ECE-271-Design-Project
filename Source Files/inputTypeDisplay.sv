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
	
	// PS/2 7-segment values
	logic [6:0] ps0 = 7'b000_1100;
	logic [6:0] ps1 = 7'b001_0010;
	logic [6:0] ps2 = 7'b010_0100;
	
	// empty 7-segment value
	logic [6:0] empty = 7'b111_1111;
	
	always_comb
		if 		(sel == 2'b00)
			begin
				Seg5 <= nes0;
				Seg4 <= nes1;
				Seg3 <= nes2;
				Seg2 <= empty;
				Seg1 <= empty;
				Seg0 <= empty;
			end
		else if 	(sel == 2'b01)
			begin
				Seg5 <= snes0;
				Seg4 <= snes1;
				Seg3 <= snes2;
				Seg2 <= snes3;
				Seg1 <= empty;
				Seg0 <= empty;
			end
		else if 	(sel == 2'b10)
			begin
				Seg5 <= ps0;
				Seg4 <= ps1;
				Seg3 <= ps2;
				Seg2 <= empty;
				Seg1 <= empty;
				Seg0 <= empty;
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