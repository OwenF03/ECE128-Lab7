`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 01:24:11 PM
// Design Name: 
// Module Name: Moore
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

parameter A = 3'b000;
parameter B = 3'b001;
parameter C = 3'b010;
parameter D = 3'b011;
parameter E = 3'b100;


module Moore(
    input X, input clk, output reg Y
    );
    
    reg [2:0] ps;
    reg [2:0] ns;
    
    initial begin
        ps = 0;
        ns = 0;
    end
    
    always @(posedge clk) begin
        case(ps)
            A: if(X)
                ns = B;
               else
                ns = A;
            B: if(X)
                ns = C;
               else
                ns = A;
            C: if(!X)
                ns = C;
               else
                ns = A;
            D: if(!X)        
            
        endcase
    
    
endmodule
