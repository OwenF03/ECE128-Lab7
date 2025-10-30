`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 03:16:45 PM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(
    input clock_in, output reg clock_out
    );
    
    reg [23:0] counter;
    
    initial begin
        clock_out <= 1'b0;
        counter <= 0;
    end
    
    
    
    always @(posedge clock_in) begin
        counter <= counter + 1;
        if(counter == 24'b111111111111111111111111) begin
            clock_out <= ~clock_out;
            counter <= 0;
        end
    end
endmodule
