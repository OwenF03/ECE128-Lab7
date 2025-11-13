`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 01:42:54 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input wire clk, input wire reset, output reg [11:0] count
    );
    
    initial begin
        count <= 0;
    end
    
    always @(posedge clk or posedge reset) begin
        if(reset)
            count <= 0;
        else
            count <= count + 1;
    end
    
endmodule