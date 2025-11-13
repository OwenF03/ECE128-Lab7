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


module ClockDivider(input wire clock_in, input wire reset, output reg clock_out);
    
    reg [22:0] counter;
    
    initial begin
        clock_out <= 1'b0;
        counter <= 0;
    end
    
    
    
    always @(posedge clock_in) begin
        if(reset) begin
            counter <= 0; 
            clock_out <= 1;
        end
        else begin
            counter <= counter + 1;
            if(counter == 23'b111111111111111111111111) begin
                clock_out <= ~clock_out;
                counter <= 0;
            end
        end
    end
    
endmodule