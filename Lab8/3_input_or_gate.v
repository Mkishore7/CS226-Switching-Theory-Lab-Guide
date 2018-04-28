// name: or_gate
module three_input_or_gate(out,a,b,c); //you list all inputs and outputs, by convention outputs go first
	output out; // this tells the compile which lines are inputs and outputs
	input a, b, c;
	assign out = a | b | c; // output function
endmodule