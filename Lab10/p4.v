// listing all inputs and outputs, by convention outputs go first

module p4(Intrusion_Zone, intrusion, Zone);
	
	output[2:0] Intrusion_Zone, intrusion; // telling the compiler which lines are inputs and outputs
	input[1:8] Zone;

	//the intrusion logic
	assign Intrusion_Zone[2] = Zone[5] | Zone[6] | Zone[7] | Zone[8];
	assign Intrusion_Zone[1] = Zone[3] | Zone[4] | Zone[7] | Zone[8];
	assign Intrusion_Zone[0] = Zone[2] | Zone[6] | Zone[4] | Zone[8];
	assign intrusion = Zone[1] | Zone[2] | Zone[3] | Zone[4] | Zone[5] | Zone[6] | Zone[7] | Zone[8];

endmodule
