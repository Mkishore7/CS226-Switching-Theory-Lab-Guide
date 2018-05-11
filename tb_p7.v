// Test bench

module tb_p7();
	wire[15:0] out;
	wire flag;
	reg[4:0] Read_Addr_1, Read_Addr_2, Write_Addr;
	reg[15:0] Data_in;
	reg clk;
	reg Write_Enable, Mux_enable;
	reg[2:0] opcode;  

	p7 UUT(out, flag, Read_Addr_1, Read_Addr_2, Write_Addr, Data_in, Write_Enable, Mux_enable, opcode, clk);
	initial 
		clk = 1'b0;
		always 
			#5 clk = ~clk;
			initial
				begin
					#10
  					Read_Addr_1 = 5'b00000; 
  					Read_Addr_2 = 5'b00001; 
  					Mux_enable = 1'b0;  
  					opcode = 3'd0;
  					Write_Enable = 1'b1;
  					Write_Addr = 5'b11010;
  					Data_in = 32'h1FFF_FFFF;
  
					#10
					Write_Enable = 1'b1;
					Write_Addr = 5'b11011; 
					Data_in = 32'h0000_0000;

					#10  
					Write_Enable = 1'b1;
					Write_Addr = 5'b11100;
					Data_in = 32'h0000_0001;

					#10
					Write_Enable = 1'b1;
					Write_Addr = 5'b00000;
					Data_in = 32'h0000_0010;

					#10
					Write_Enable = 1'b1;
					Write_Addr = 5'b11101;
					Data_in = 32'h0000_0011;

					#10
					Write_Enable = 1'b1;
					Write_Addr = 5'b11110;
					Data_in = 32'h0000_0100;

					#10
					Mux_enable = 1;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00001;
					opcode = 3'd0;

					#10
					Write_Enable = 1'b0;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00010;
					opcode = 3'd0;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00101;
					Read_Addr_2 = 5'b00011;
					opcode = 3'd0;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00001;
					opcode = 3'd1;

					#10
					Write_Enable = 1'b0;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00010;
					opcode = 3'd1;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00101;
					Read_Addr_2 = 5'b00011;
					opcode = 3'd1;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00001;
					opcode = 3'd2;

					#10
					Write_Enable = 1'b0;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00010;
					opcode = 3'd2;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00101;
					Read_Addr_2 = 5'b00011;
					opcode = 3'd2;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00001;
					opcode = 3'd3;

					#10
					Write_Enable = 1'b0;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00010;
					opcode = 3'd3;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00101;
					Read_Addr_2 = 5'b00011;
					opcode = 3'd3;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00001;
					opcode = 3'd4;

					#10
					Write_Enable = 1'b0;
					Read_Addr_1 = 5'b00100;
					Read_Addr_2 = 5'b00010;
					opcode = 3'd4;

					#10
					Write_Enable = 1'b1;
					Read_Addr_1 = 5'b00101;
					Read_Addr_2 = 5'b00011;
					opcode = 3'd4;
				end
endmodule