module snescontroller(input logic clk,
							input logic Latch,
							input logic a, b, up, dn, lt, rt, st, sel, x, y, lb, rb,
							output logic data);

	ShiftReg #(12) shiftregister (.clk(clk), .load(Latch), .d({b, y, sel, st, up, dn, lt, rt, a, x, lb, rb}), .sout(data));
				
endmodule