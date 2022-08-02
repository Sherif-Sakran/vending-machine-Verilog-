`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2021 10:46:06 PM
// Design Name: 
// Module Name: BCD4
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


module BCD4 (input[3:0] in, output reg [6:0] out);
       always @(in) begin 
               case(in)  
                       4'b0000: out= 7'b1000000;
                       4'b0001: out= 7'b1111001;
                       4'b0010: out= 7'b0100100;
                       4'b0011: out= 7'b0110000;
                       4'b0100: out= 7'b0011001;
                       4'b0101: out= 7'b0010010;
                       4'b0110: out= 7'b0000010;
                       4'b0111: out= 7'b1111000;
                       4'b1000: out= 7'b0000000;
                       4'b1001: out= 7'b0010000;
//                       4'b1010: out= 7'b0111111;
//                       4'b1011: out= 7'b1111111;


               endcase 
       end
endmodule
