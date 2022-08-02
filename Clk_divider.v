`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2021 10:49:07 PM
// Design Name: 
// Module Name: Clk_divider
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


module Clk_divider #(parameter N = 50000000) (input clk, rst, output final_clk);
reg clk_div = 0;
reg [31:0] count;

always @ (posedge(clk), posedge(rst))
begin
if (rst == 1'b1) begin
clk_div <= 1'b0;
count <= 32'b0; end
else if (count == N - 1) begin
clk_div <= ~clk_div;
count <= 32'b0; end
else begin
clk_div <= clk_div;
count <= count + 1; end
end

assign final_clk = clk_div;
endmodule
