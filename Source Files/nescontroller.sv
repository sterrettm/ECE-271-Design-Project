module nescontroller(input logic clk,
							input logic Latch,
							input logic a, b, up, dn, lt, rt, st, sel,
							output logic data);

	ShiftReg shiftregister(.clk(clk), .load(Latch), .d({rt, lt, dn, up, st, sel, b, a}), .sout(data));
				
endmodule