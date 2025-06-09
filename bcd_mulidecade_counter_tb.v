`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 15:44:29
// Design Name: 
// Module Name: bcd_mulidecade_counter_tb
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


module bcd_mulidecade_counter_tb;
reg clk, enable, reset;
wire done;
wire [3:0] ones , tens , hundred;
bcd_multidecade_counter uut(
.enable(enable),
.reset(reset),
.clk(clk),
.done(done),
.ones(ones),
.tens(tens),
.hundred(hundred)
);
always #5 clk = ~clk;
initial begin
    clk = 1'b0;
    reset = 1'b0;
    #2 reset = 1'b1;
    #2 enable = 1'b1;
    repeat(200)@(negedge clk);
    end
 initial 
    #20000 $stop;

endmodule
