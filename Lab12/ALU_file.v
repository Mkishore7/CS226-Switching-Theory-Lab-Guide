module ALU(Result,zeroflag, opcode,A,B);
output[7:0] Result;
output zeroflag;
input [7:0] A,B;
input [1:0] opcode;
reg   [7:0] Result;

assign zeroflag= ~|Result;
always @ *
       case (opcode)
      2'b00:  Result <= A+B;
      2'b01:  Result <= A-B;
      2'b10:  Result <= A &B;
      2'b11:    Result <= A^B;
      default:	Result <= 8'd0;
    endcase
endmodule


module tb_ALU();
reg clk, reset;
reg[7:0] ResultExpected;
wire[7:0] Result;
wire zeroflag;
reg zeroflagExprected;
reg [7:0] A,B;
reg [1:0] opcode;
reg [31:0] vectornum, errors;
reg [26:0] testvectors [10000:0];
// instantiate device under test
ALU DUT (Result, zeroflag, opcode,A,B);
// generate clock
always
begin
clk = 1; #5; clk = 0; #5;
end
// at start of test, load vectors
// and pulse reset
initial
begin
$readmemb ("alu_example.tv", testvectors);
vectornum = 0; errors = 0;
reset = 1; #27; reset = 0;
end
// apply test vectors on rising edge of clk
always @ (posedge clk)
begin
 #1; {ResultExpected, zeroflagExprected, opcode, A, B} = testvectors[vectornum];
end
// check results on falling edge of clk
always @ (negedge clk)
if (~reset) begin // skip during reset
if (Result !== ResultExpected) begin
$display ("Error: inputs = %b", {A, B});
$display ("outputs = %b (%b expected), ZeroFlag = %b (%b expected)",Result, ResultExpected,zeroflag, zeroflagExprected);
errors = errors + 1;
end
vectornum = vectornum + 1;
if (testvectors[vectornum] === 4'bx) begin
$display ("%d tests completed with %d errors",vectornum, errors);
//$finish;
end
end
endmodule