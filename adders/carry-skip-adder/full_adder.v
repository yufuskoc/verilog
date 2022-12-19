`timescale 1ns / 1ps

module FullAdder(a, b, cin, sum, cout, p);

input a, b, cin;
output reg sum, cout, p;

always @(*) begin
    sum = a^b^cin;
    cout = (a&b)|((a^b)&cin);
    p = a^b;
end

endmodule
