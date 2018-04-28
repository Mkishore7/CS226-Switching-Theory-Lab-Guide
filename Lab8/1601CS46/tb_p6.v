module tb_p6();
	reg I1, I2, I3;
	wire O1, O2;
	
	p6 UUT (O1, O2, I1, I2, I3);
	initial
		begin //changing inputs
			I3 = 1'b0;
			I2 = 1'b0;
			I1 = 1'b0;
			#10;
			
			I3 = 1'b0;
			I2 = 1'b0;
			I1 = 1'b1;
			#10;
			
			I3 = 1'b0;
			I2 = 1'b1;
			I1 = 1'b0;
			#10;
			
			I3 = 1'b0;
			I2 = 1'b1;
			I1 = 1'b1;
			#10;
			
			I3 = 1'b1;
			I2 = 1'b0;
			I1 = 1'b0;
			#10;
			
			I3 = 1'b1;
			I2 = 1'b0;
			I1 = 1'b1;
			#10;
			
			I3 = 1'b1;
			I2 = 1'b1;
			I1 = 1'b0;
			#10;
			
			I3 = 1'b1;
			I2 = 1'b1;
			I1 = 1'b1;
			#10;
		end
		
		initial
		begin
			$monitor("I3 = %b, I2 = %b, I1 = %b, O1 = %b, O2 = %b, time = %t \n", I3, I2, I1, O1, O2, $time);
		end
endmodule