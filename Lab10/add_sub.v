
module add_sub(V,s,cout,sel,A,B);
input [3:0] A, B; // Declaration of two four-bit inputs
input sel; // and the one-bit input carry
output [3:0] s; // Declaration of the five-bit outputs
output V,cout;  //overflow bit
wire [3:0] D;
wire [3:1] c;  // internal carry wires
assign V= c[3] ^ cout;  // carry 3 or 4 creates an overflow
//overflow indicates wrong output
assign D=B ^({sel,sel,sel,sel});
fulladder fa0(A[0],D[0],sel,s[0],c[1]);
fulladder fa1(A[1],D[1],c[1],s[1],c[2]);
fulladder fa2(A[2],D[2],c[2],s[2],c[3]);
fulladder fa3(A[3],D[3],c[3],s[3],cout);
endmodule




module fulladder(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  reg sum,cout;
  always @ (a or b or cin)
  begin
    sum <= a ^ b ^ cin;
    cout <= (a & b) | (a & cin) | (b & cin);
  end
endmodule
