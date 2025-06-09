`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 15:33:13
// Design Name: 
// Module Name: bcd_multidecade_counter
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


module bcd_multidecade_counter(
    input enable,
    input reset,
    input clk,
    output done,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundred
);

    wire a0, a1, a2;
    wire done0, done1, done2;

    // Ones place
    bcd_counter B0(
        .enable(enable),
        .reset(reset),
        .clk(clk),
        .done(done0),
        .Q(ones)
    );
    assign a0 = done0 & enable;

    // Tens place
    bcd_counter B1(
        .enable(a0),
        .reset(reset),
        .clk(clk),
        .done(done1),
        .Q(tens)
    );
    assign a1 = done1 & a0;

    // Hundreds place
    bcd_counter B2(
        .enable(a1),
        .reset(reset),
        .clk(clk),
        .done(done2),
        .Q(hundred)
    );
    assign a2 = done2 & a1;

    // Final done signal 
    assign done = a2;

endmodule

