`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2021 10:47:37 PM
// Design Name: 
// Module Name: mux41
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


module mux41 (input [6:0] x1, x2, x3, x4, input [1:0] s1, output reg [6:0] out_leds); 

always @( x1 or x2 or x3 or x4 or s1)
begin
case(s1)
2'b00: out_leds = x1;
2'b01: out_leds = x2;
2'b10: out_leds = x3;
2'b11: out_leds = x4;
endcase
end

endmodule