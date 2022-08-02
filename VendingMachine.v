`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 10:51:38 PM
// Design Name: 
// Module Name: lock
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


module VendingMachine (
	input clk, rst, in1,in5,in10,inStop,
	output reg out, output reg [4:0] state);		
wire clk1sec;
reg [4:0]counter;
reg rstCounter;

	Clk_divider #(50000000) slow(clk, rst, clk1sec);

    always @(posedge clk1sec, posedge rstCounter)
    if (rstCounter)
        counter<=0;
    else if (clk1sec)
         counter<=counter+1;           
    
	always @(negedge rst, posedge clk)
    begin
       if(rst)
            begin
                state <= 0;
                out<=0;
                rstCounter<=1;                           
            end
        
		else if(in1) // if(in1 &&out!=1)
        begin  
            if (out==1)
                out<=0;
            rstCounter<=1;                           
            if (state+1==20)
                begin
                state <= 1'b0;
                out <= 1;               
                end         
            else
                    state <=state +1;                           
        end
        else if(in5 )
        begin
            if (out==1)
            out<=0;
            rstCounter<=1;                           
            if (state+5>=20)
                begin
                state <= state - 15;
                out <= 1;
                end         
        else
                state <=state +5; 
        end
        else if(in10 )
        begin
            if (out==1)
            out<=0;
            rstCounter<=1;                           
            if (state+10>=20)
                begin
                    state <= state - 10;
                    out <= 1;
                end         
            else
                state <=state +10; 
        end                                           
        else if(inStop)  
        begin
            rstCounter<=1;                           
            out <= 0;
        end
        
        else if (counter==30)
        begin
            state <= 0;
            out<=0; 
            rstCounter<=1;                           
        end
        
        else
            rstCounter<=0;    
end
endmodule
				