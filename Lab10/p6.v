//listing all inputs and outputs, by convention outputs go first

module decade_counter(q, clk);
	output reg[3:0] q = 0;			// telling the compiler which lines are inputs and outputs
	input clk;
	always @(posedge clk)
		q <= q == 9 ? 0 : q + 1;
endmodule

module decoded_counter(ctrl, clk);
	output ctrl;				// Tells the compiler which lines are inputs and outputs
	input clk;
	reg [3:0] count_value = 0;
	always @(posedge clk)
		count_value <= count_value + 1;
		assign ctrl = count_value == 4'b0111 || count_value == 4'b1011;
endmodule