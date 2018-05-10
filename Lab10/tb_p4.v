// Test bench for p4.v

module tb_p4();

	reg[1:8] Zone;
	wire[2:0] Intrusion_Zone;
	wire intrusion;
	integer i;
	p4 UUT(Intrusion_Zone, intrusion, Zone);
	initial
		begin //intrusion in zones
			for (i = -1; i <= 255; i = i + 1)
				begin
					Zone = i; #10
					$monitor("Zone = %b, intrusion = %b, Intrusion_Zone = %b\n", Zone, intrusion, Intrusion_Zone);
					$display("---------------------");
				end
		end

endmodule