`timescale 1ns / 1ps

module CarrySkipAdder(a, b, cin, sum, cout);

input [3:0]a, b;
input cin;
output reg [3:0]sum;
output reg cout;

wire [3:0]w_sum, w_cout, w_p;

reg r_sel;

FullAdder f1(a[0], b[0], cin, w_sum[0], w_cout[0], w_p[0]);
FullAdder f2(a[1], b[1], w_cout[0], w_sum[1], w_cout[1], w_p[1]);
FullAdder f3(a[2], b[2], w_cout[1], w_sum[2], w_cout[2], w_p[2]);
FullAdder f4(a[3], b[3], w_cout[2], w_sum[3], w_cout[3], w_p[3]);

always @(*) begin
    r_sel = (w_p[0]&w_p[1])&(w_p[2]&w_p[3]);
    sum = w_sum;
    
    if(r_sel == 0) begin
        cout = w_cout[3];
    end else if(r_sel == 1) begin
        cout = cin;
    end
end

endmodule
