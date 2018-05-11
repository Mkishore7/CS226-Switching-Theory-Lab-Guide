module tb_decade_counter();
	wire [3:0]q;
	reg clk = 0;
	decade_counter UUT(q, clk);
		always #10 clk = ~clk;
endmodule

module tb_decoded_counter();
	reg clk = 0;
	wire ctrl;
	decoded_counter UUT(ctrl, clk);
		always #10 clk = ~clk;
endmodule