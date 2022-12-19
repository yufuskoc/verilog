`timescale 1ns / 1ps

module FullAdder(a, b, cin, sum, cout);

input a, b, cin;
output reg sum, cout;

always @(*) begin
    sum = a^b^cin;
    cout = (a&b)|((a^b)&cin);
end

endmodule
