// lines start with “//” is a comment
// name: p5.v // gate level model
module p5(A, m2, m1, m0); //you list all inputs and outputs, by convention outputs go first
	output A; // this tells the compile which lines are inputs and outputs
	input m2, m1, m0;
	
	and a0 (a0_o, m1, m0); // defines the a0 gate, see figure
	and a1 (a1_o, m2, m0); // defines the a1 gate, see figure
	and a2 (a2_o, m2, m1); // defines the a2 gate, see figure
	or o0 (A, a0_o, a1_o, a2_o); // defines the o0 gate, see figure
endmodule