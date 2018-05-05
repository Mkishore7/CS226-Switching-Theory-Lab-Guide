// listing all inputs and outputs, by convention outputs go first
module p3(Result,opcode,A,B);
output[15:0] Result;
input [15:0] A,B;
input [2:0] opcode;
reg   [15:0] Result;

always @ (opcode)
	case (opcode) //ALU implementation
		3'd0:	Result <= A+B;
		3'd1:	Result <= A-B;
		3'd2:	Result <= A&B;
		3'd3:	Result <= A^B;
		3'd4:	Result <= A|B;
		3'd5:	Result <= A+1;
		3'd6:	Result <= A<<1;
		3'd7:	Result <= A>>1;
		default:	Result <= 16'd0;
	endcase
endmodule

