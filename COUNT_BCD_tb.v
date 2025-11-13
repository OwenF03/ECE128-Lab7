`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 02:18:57 PM
// Design Name: 
// Module Name: COUNT_BCD_tb
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

 

module COUNT_BCD_tb();
reg clk = 0;
reg [11:0] count;
reg reset; 
wire rdy; 
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hund; 
wire [3:0] thou; 
COUNT_BCD dut(.clk(clk), .reset(reset), .count(count), .BCD({thou, hund, tens, ones}), .rdy(rdy));

always #1 clk = ~clk; 
initial begin
    count = 0; //Count is zero
    reset = 1; //Reset 
    #2 reset = 0; count = 100; // two intermediate values
    #64 count = 1024; //second intermediate value
    #64  count = 3579; //some additional test digits 
    #64 count = 4095; //max counter value
    #64 count = 0; //Count is zero
    #12 count = 12; // Start new conversion 
    #12 count = 24; //Supply new count value mid conversion (ignored)
    #36 count = 36; //Starts new conversion because 12 will have completed
    #64 $finish; 
end



endmodule
