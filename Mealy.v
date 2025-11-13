`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2025 02:20:37 PM
// Design Name: 
// Module Name: Mealy
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


module Mealy(
    input wire x, input wire reset, input wire clk, output reg y
    );
    
    parameter A = 0, B = 1, C = 2, D = 3; //States
    reg [1:0] ns = 0; //Next state
    reg [1:0] cs = 0; //Current state
    
    //Transition logic
    always @(x or cs) begin
        case (cs)
            A : begin
                if(x) ns <= B;
                else ns <= A;
            end
            
            B: begin
                if(x) ns <= C;
                else ns <= A;
            end
            
            C: begin 
                if(x) ns <= C;
                else ns <= D; 
            end
            
            D: begin
                if(x) ns <= B; 
                else ns <= A; 
            end
            default: ns <= A; 
        endcase
    end
  

    //State transition
    always @(posedge clk or posedge reset) begin
        if(reset) cs <= A;
        else cs <= ns; 
    end
    
    //Assign output
    always @(posedge cs or x) begin
        // Output is high if x is 1 in state D
        if(cs == D) begin 
            if(x) y <= 1; 
        end
        else
            y <= 0;
    end
    
    
endmodule
