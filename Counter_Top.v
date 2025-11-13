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


module CounterTop( input wire clk, input wire reset, output wire [3:0] an, output wire [7:0] seg);
    
    wire rdy;
    reg [15:0] latched_BCD; //Supply multi_driver with accurate BCD value
    
    // CLOCK DIVIDER
    wire clk_dvd; //Divided clock
    // Generates a clock with a period of ~6 hertz
    ClockDivider clkdvd(.clock_in(clk), .clock_out(clk_dvd), .reset(reset));
    
    // 12 BIT UP COUNTER
    wire [11:0] count;
    Counter ct(.clk(clk), .en(clk_dvd), .reset(reset), .count(count)); //Counter updates at human readable speed 
    
    
    //COUNTER VALUE TO BCD
    wire [15:0] BCD_out; 
    COUNT_BCD converter(.clk(clk), .reset(reset), .count(count), .BCD(BCD_out), .rdy(rdy));
    
    // Wait to set value utnil it is ready
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            latched_BCD <= 0;
        end
        else if(rdy) begin
            latched_BCD <= BCD_out; 
        end
    end
    
    //Display completed BCD value to seven segment display
    wire [3:0] md_an; wire [7:0] md_seg; 
    Multi_Driver MD(.clk(clk), .sw(latched_BCD), .an(md_an), .seg(md_seg));
    assign an = md_an;
    assign seg = md_seg;
    
    
endmodule