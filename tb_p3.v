module tb_p3(); //test_bench
	wire[15:0] Result;
	reg [15:0] A,B;
	reg [2:0] opcode;
	
	integer i;
	p3 UUT (Result, opcode, A, B); 
	initial
		begin //checking for random values of A,B
		    for( i = 0; i <= 7; i = i + 1)
				begin
					A=$urandom%2**15;
					B=$urandom%2**15;
					opcode=i;
					$monitor("Opcode = %d", i," | A = %d", A, " | B = %d", B, " | Result = %d", Result);
					#10;
					$display("-----------------------------------------");
				end
		end
endmodule