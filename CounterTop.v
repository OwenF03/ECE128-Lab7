`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 02:05:28 PM
// Design Name: 
// Module Name: CounterTop
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


module CounterTop(
    input clk, input R, output [3:0] an, output [7:0] seg
    );
    
    
    wire clk_dvd;
    ClockDivider clkdvd(clk, clk_dvd);
    
    wire [11:0] count;
    Counter ct(clk_dvd, R, count);
    
    wire [15:0] BCD;
    COUNT_BCD CBCD(count, BCD);
    
    Multi_Driver MD(clk, BCD, an, seg);
    
    
endmodule
