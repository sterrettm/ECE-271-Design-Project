module CursorController(
input logic clock50MHz,
input logic left, right, up, down,
output logic [5:0] x_cursor, y_cursor
);

Counter #(25000000, 26) clockslower1hz(
.clockin  (clock50MHz),
.reset    (1'b0),
.clockout (clock1Hz)
);
always_ff @(posedge clock1Hz)
begin

	if (left)
		x_cursor -= 1;
	else if (up)
		y_cursor -= 1;
	else if (right)
		x_cursor += 1;
	else if (down)
		y_cursor += 1;
		
end

endmodule
