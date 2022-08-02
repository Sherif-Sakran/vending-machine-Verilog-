`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2021 10:49:55 PM
// Design Name: 
// Module Name: bin_counter
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


module bin_counter #(parameter n = 4) (input clk, reset, Updown, Inc, output reg [n-1:0] count);

   wire f_clk;
   //Clk_divider #(500000) cd (clk, reset, f_clk);
   always @(posedge clk, posedge reset) begin 
       if (reset == 1)  count <= 0; // non blocking assignment
       else 
       begin
       if (Updown == 0) begin
           if (Inc == 0) begin count <= count + 1; end // non blocking assignment 
           else if (Inc == 1) begin count <= count + 2; end end
       
           else if (Updown == 1) begin
           if (Inc == 0) begin count <= count - 1; end // non blocking assignment 
           else if (Inc == 1) begin count <= count - 2; end end
       end
   end 
endmodule
