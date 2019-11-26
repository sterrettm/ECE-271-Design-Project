module Counter(
clockin, reset, z, clockout
);

parameter FACTOR = 10;
parameter OUTBITS = 4;

input logic clockin, reset;
output logic [OUTBITS - 1:0]z;
output logic clockout;

reg [OUTBITS - 1:0]storage = 'b0;

assign z = storage;

always_ff @(posedge clockin or posedge reset)
begin

	if (reset)
	begin
		storage <= '0;
	end
	else
	begin
		
		if (storage + 1'b1 == FACTOR)
		begin
			storage <= '0;
			clockout <= 1'b1;
		end
		else
		begin
			storage <= storage + 1'b1;
			clockout <= 1'b0;
		end
	
	end
	
end

endmodule
