`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2021 10:51:02 PM
// Design Name: 
// Module Name: dec2_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dec2_4(input [1:0] in, output reg [3:0] out);
always@(in) begin
    case(in)
        2'b00: out = 4'b1110;
        2'b01: out = 4'b1101;
        2'b10: out = 4'b1011;
        2'b11: out = 4'b0111;
    endcase
end
endmodule