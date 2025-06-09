`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:55:48
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
input enable,
input reset,
input clk,
output done,
output [3:0] Q

    );
 reg [3:0] q_present, q_next;
 //preset state logic
 always@(posedge clk or negedge reset)
    if(~reset)
        q_present <= 'b0;
    else if(enable)
        q_present <= q_next;
    else
        q_present <= q_present;
 //next state logic
 assign done = (q_present == 9);
 always@(*)
    if(done)
        q_next = 'b0;
     else
        q_next = q_present + 1;
 //output logic
 assign Q = q_present;
 
 
endmodule
