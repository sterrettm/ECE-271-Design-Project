force clk 1 0, 0 {1 ps} -repeat 2
force reset 1 @ 0, 0 @ 1

force next 0 @ 0, 1 @ 10, 0 @ 20, 1 @ 30, 0 @ 40, 1 @ 50, 0 @ 60
force prev 0 @ 0, 1 @ 80, 0 @ 90, 1 @ 100, 0 @ 110, 1 @ 120, 0 @ 130

run 150
