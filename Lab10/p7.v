//all inputs and outputs, by convention outputs go first

module p7(out, zf, read_addr1, read_addr2, wa, dIn, wrCtrl, mxCtrl, opn, clk);
	input[4:0] read_addr1, read_addr2, wa;
	input[15:0] dIn;					// Input data
	input wrCtrl, mxCtrl;				// Write and MUX control
	input[2:0] opn;						// Opcode input
	input clk;							// Clock input
	output out;
	wire[15:0] out;
	output zf;

	reg[15:0] Reg[31:0];				//array of registers
	initial
		begin
			Reg[0] = 16'd1;
			Reg[1] = 16'd2;
			Reg[2] = 16'd3;
			Reg[3] = 16'd4;
			Reg[4] = 16'd5;
			Reg[5] = 16'd6;
			Reg[6] = 16'd7;
			Reg[7] = 16'd8;
			Reg[8] = 16'd9;
			Reg[9] = 16'd10;
			Reg[10] = 16'd11;
			Reg[11] = 16'd12;
			Reg[12] = 16'd13;
			Reg[13] = 16'd14;
			Reg[14] = 16'd15;
			Reg[15] = 16'd16;
			Reg[16] = 16'd17;
			Reg[17] = 16'd18;
			Reg[18] = 16'd19;
			Reg[19] = 16'd20;
			Reg[20] = 16'd21;
			Reg[21] = 16'd22;
			Reg[22] = 16'd23;
			Reg[23] = 16'd24;
			Reg[24] = 16'd25;
			Reg[25] = 16'd26;
			Reg[26] = 16'd27;
			Reg[27] = 16'd28;
			Reg[28] = 16'd29;
			Reg[29] = 16'd30;
			Reg[30] = 16'd31;
		end 

	wire[15:0] wire_out;
	wire wzf;
	alu asd(.Result(wire_out), .zf(wzf), .opcode(opn), .A(Reg[read_addr1]), .B(Reg[read_addr2]));		//Calling ALU

	assign out = wire_out;
	assign zf = ~|wire_out;
	wire [15:0] towrite;
	mux dwd(.out(towrite), .input1(dIn), .input2(out), .sel(mxCtrl));		// Calling MUX

	always@(posedge clk)
		begin
			if (wrCtrl)
				Reg[wa] <= towrite;
		end
endmodule

// ALU module
module alu(Result, zf, opcode, A, B);
	output[15:0] Result;			//which lines are inputs and outputs
	output zf;
	reg zf;
	input[15:0] A, B;
	input[2:0] opcode;
	reg[15:0] Result;

	always@(opcode)
		begin
       		case(opcode)
      			3'd0:  	Result <= A + B;
      			3'd1:  	Result <= A - B;
      			3'd2:  	Result <= A ^ B;
      			3'd3:  	Result <= A & B;
      			3'd4:	Result <= A | B;
      			3'd5:	Result <= A + 16'd1;
      			3'd6:	Result <= A << 1;
      			3'd7:	Result <= A >> 1;
      			default:	Result <= 16'd0;
    		endcase
    		zf = ~|Result;
		end
endmodule

// MUX module
module mux(out, input1, input2, sel);

	output[15:0] out;				//which lines are inputs and outputs
	input[15:0] input1;
	input[15:0 ]input2;
	input sel;

	assign out = sel ? input1 : input2;
endmodule