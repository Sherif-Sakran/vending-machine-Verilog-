`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 11:17:19 PM
// Design Name: 
// Module Name: digitalLock
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

module VendingMachineMain(input clk, RxD, output [3:0]en, output [6:0]LEDs, output out);
//assign en = 4'b1110;
wire a,b,c,d,rst;
wire a_sync, b_sync, c_sync, d_sync, rst_sync;
wire a_db, b_db, c_db, d_db;
wire a_re, b_re, c_re, d_re;
wire slow_clk;
//wire state;
wire [4:0] state;
UART #(8'b01100001) UCall_a (.clk(clk), .RxD(RxD), .RxData(), .output_level(a));
UART #(8'b01100010) UCall_b (.clk(clk), .RxD(RxD), .RxData(), .output_level(b));
UART #(8'b01100011) UCall_c (.clk(clk), .RxD(RxD), .RxData(), .output_level(c));
UART #(8'b01100100) UCall_d (.clk(clk), .RxD(RxD), .RxData(), .output_level(d));
UART #(8'b01100101) UCall_rst (.clk(clk), .RxD(RxD), .RxData(), .output_level(rst));

synchronizer SCall_a (.clk(clk), .sig(a), .sigout(a_sync));
synchronizer SCall_b (.clk(clk), .sig(b), .sigout(b_sync));
synchronizer SCall_c (.clk(clk), .sig(c), .sigout(c_sync));
synchronizer SCall_d (.clk(clk), .sig(d), .sigout(d_sync));
synchronizer SCall_rst (.clk(clk), .sig(rst), .sigout(rst_sync));

divider #(250000) DCall_clk (.clk(clk), .rst(rst_sync), .clk_out(slow_clk));

debouncer DBCall_a (.D(a_sync), .clk(slow_clk), .Q(a_db));
debouncer DBCall_b (.D(b_sync), .clk(slow_clk), .Q(b_db));
debouncer DBCall_c (.D(c_sync), .clk(slow_clk), .Q(c_db));
debouncer DBCall_d (.D(d_sync), .clk(slow_clk), .Q(d_db));


//assign a_db = a_sync;
//assign b_db = b_sync;
//assign c_db = c_sync;
//assign d_db = d_sync;

risingEdgeDetector RECall_a (.clk(clk), .rst(rst_sync), .level(a_db), .tick(a_re));
risingEdgeDetector RECall_b (.clk(clk), .rst(rst_sync), .level(b_db), .tick(b_re));
risingEdgeDetector RECall_c (.clk(clk), .rst(rst_sync), .level(c_db), .tick(c_re));
risingEdgeDetector RECall_d (.clk(clk), .rst(rst_sync), .level(d_db), .tick(d_re));

wire clk_100hz;
Clk_divider #(500_000) cd2 (clk, 0, clk_100hz);

wire [1:0] count;
bin_counter #(2) bc (clk_100hz, 0, 0, 0, count);
dec2_4 decoder (count, en);
    
//wire [3:0]D1;
//wire [3:0]D2;  
VendingMachine VMCall (.clk(clk), .rst(rst_sync), .in1(a_re), .in5(b_re), .in10(c_re), .inStop(d_re), .out(out), .state(state));

wire [3:0] u;
wire [3:0] t;
assign u = state%10;
assign t = (state/10)%10;
wire [6:0]out34 = 7'b1000000;
    wire [6:0] out1;
    wire [6:0] out2;
    
    BCD4  bcd1 (u, out1);
    BCD4  bcd2 (t, out2);                          

    mux41 mm(out34, out34, out2, out1, count, LEDs);

//display Ds(.state(state), .letter(LEDs));

endmodule
