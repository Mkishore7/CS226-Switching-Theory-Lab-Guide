// lines start with “//” is a comment
// name: p6.v // gate level model
module p6(O1, O2, I1, I2, I3); //you list all inputs and outputs, by convention outputs go first
	output O1, O2; // this tells the compile which lines are inputs and outputs
	input I1, I2, I3;
	
	//not n1 (inv_S1, S[1]); // defines the inverter gate, see figure
	
	nor nor1(nor1_o, I1, I2); // defines the gate, see figure 
	nand nand1 (nand1_o, I1, I2); // defines the gate, see figure
	not not1 (inv_I3, I3); // defines the inverter gate, see figure
	
	not not2 (inv_inv_I3, inv_I3); // defines the gate, see figure
	not not3 (inv_nand1_o, nand1_o); // defines the gate, see figure
	not not4 (inv_inv_inv_I3, inv_inv_I3);
	
	nor nor2(nor2_o, inv_nand1_o, nor1_o);
	or or1(or1_o, nor1_o, inv_inv_inv_I3);
	xor xor1(xor1_o, nor2_o, inv_inv_I3);
	
	nand nand2(O1, nand1_o, or1_o);
	not not5(O2, xor1_o);
endmodule