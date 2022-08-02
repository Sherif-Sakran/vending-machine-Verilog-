`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 11:09:05 PM
// Design Name: 
// Module Name: display
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


module display(input state, output reg [6:0] letter);
        always @(*) begin
        case(state)                      
        4'b00000: letter= 7'b1000000;
        4'b00001: letter= 7'b1111001;
        4'b00010: letter= 7'b0100100;
        4'b00011: letter= 7'b0110000;
        4'b00100: letter= 7'b0011001;
        4'b00101: letter= 7'b0010010;
        4'b00110: letter= 7'b0000010;
        4'b00111: letter= 7'b1111000;
        4'b01000: letter= 7'b0000000;
        4'b01001: letter= 7'b0010000;
//        4'b01010: letter= 7'b0111111;
//        4'b01011: letter= 7'b1111111;
        endcase
end
endmodule
