`timescale 1ns / 1ps

module CSA64(a, b, clk, cin, sum, cout);

input [63:0]a, b;
input clk, cin;
output reg [63:0]sum;
output reg cout;

wire [63:0]w_sum;
wire [15:0]w_cout;

CarrySkipAdder skip1(a[3:0], b[3:0], cin, w_sum[3:0], w_cout[0]);
CarrySkipAdder skip2(a[7:4], b[7:4], w_cout[0], w_sum[7:4], w_cout[1]);
CarrySkipAdder skip3(a[11:8], b[11:8], w_cout[1], w_sum[11:8], w_cout[2]);
CarrySkipAdder skip4(a[15:12], b[15:12], w_cout[2], w_sum[15:12], w_cout[3]);
CarrySkipAdder skip5(a[19:16], b[19:16], w_cout[3], w_sum[19:16], w_cout[4]);
CarrySkipAdder skip6(a[23:20], b[23:20], w_cout[4], w_sum[23:20], w_cout[5]);
CarrySkipAdder skip7(a[27:24], b[27:24], w_cout[5], w_sum[27:24], w_cout[6]);
CarrySkipAdder skip8(a[31:28], b[31:28], w_cout[6], w_sum[31:28], w_cout[7]);
CarrySkipAdder skip9(a[35:32], b[35:32], w_cout[7], w_sum[35:32], w_cout[8]);
CarrySkipAdder skip10(a[39:36], b[39:36], w_cout[8], w_sum[39:36], w_cout[9]);
CarrySkipAdder skip11(a[43:40], b[43:40], w_cout[9], w_sum[43:40], w_cout[10]);
CarrySkipAdder skip12(a[47:44], b[47:44], w_cout[10], w_sum[47:44], w_cout[11]);
CarrySkipAdder skip13(a[51:48], b[51:48], w_cout[11], w_sum[51:48], w_cout[12]);
CarrySkipAdder skip14(a[55:52], b[55:52], w_cout[12], w_sum[55:52], w_cout[13]);
CarrySkipAdder skip15(a[59:56], b[59:56], w_cout[13], w_sum[59:56], w_cout[14]);
CarrySkipAdder skip16(a[63:60], b[63:60], w_cout[14], w_sum[63:60], w_cout[15]);

always @(posedge clk) begin
    sum = w_sum;
    cout = w_cout[15];
end

endmodule
