// Test bench for p5.v
module tb_vat_buzzer_behavior();
	reg[6:0] V;
	wire Buzzer;
	integer i; //taking inputs
	vat_buzzer_behavior UUT(Buzzer, V[0], V[1], V[2], V[3], V[4], V[5], V[6]);
	initial
		begin //giving 7 bits input
		$monitor("V = %b, | buzzer = %b", V, Buzzer);
			for (i = -1; i <= 127; i = i + 1)
				begin
					V = i; #10	
					$display("-------------------------------");
				end
		end
endmodule

module tb_alarm_priority();
	reg[8:1] Zone;
	wire[2:0] Intrusio_Zone;
	wire intrusion;
	integer i;
	alarm_priority UUT(Intrusio_Zone, intrusion, Zone);
	initial
		begin //giving 8 bits inputs
		$monitor("Zone = %b, intrusion = %b, Intrusio_Zone = %b\n", Zone, intrusion, Intrusio_Zone);
			for (i = -1; i <= 255; i = i + 1)
				begin
					Zone = i; #10
					$display("--------------------------------------------------");
				end
		end
endmodule