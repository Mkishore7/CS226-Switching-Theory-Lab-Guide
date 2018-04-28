module tb_3_input_and_gate(); // Test bench fortb_ and_gate.v
	reg a,b,c; // a reg, to allow us to assign the input, and a wire to receive the output
	wire out;
	three_input_and_gate uut(out,a,b,c); // this instantiates a and gate, uut is a label
	initial
	begin
		a = 1'b0; // here we apply inputs to the gate
		b = 1'b0;
		c = 1'b0;
		#10;
		a = 1'b0;
		b = 1'b0;
		c = 1'b1;
		#10;
		a = 1'b0;
		b = 1'b1;
		c = 1'b0;
		#10;
		a = 1'b0;
		b = 1'b1;
		c = 1'b1;
		#10;
		a = 1'b1;
		b = 1'b0;
		c = 1'b0;
		#10;
		a = 1'b1;
		b = 1'b0;
		c = 1'b1;
		#10;
		a = 1'b1;
		b = 1'b1;
		c = 1'b0;
		#10;
		a = 1'b1;
		b = 1'b1;
		c = 1'b1;
		#10;
	end
	// set up the monitoring
	initial
		begin
			$monitor("a=%b, b=%b, c=%b, out=%b, time=%t\n", a, b, c, out, $time);
		end
endmodule