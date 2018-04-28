// lines start with “//” is a comment
// name: p2.v // gate level model

module p2(L, D); //you list all inputs and outputs, by convention outputs go first
	output L; // this tells the compile which lines are inputs and outputs
	input[2:0] D;
	
	not n2 (inv_D2, D[2]); // defines the inverter gate, see figure
	not n1 (inv_D1, D[1]); // defines the inverter gate, see figure
	not n0 (inv_D0, D[0]); // defines the inverter gate, see figure
	
	and a0 (a0_o, inv_D0, inv_D2); // defines the a0 gate, see figure
	and a1 (a1_o, inv_D1, inv_D2); // defines the a1 gate, see figure
	or o0 (L, a0_o, a1_o); // defines the o0 gate, see figure
endmodule