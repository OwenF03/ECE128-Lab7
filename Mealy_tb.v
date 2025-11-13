`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2025 02:46:48 PM
// Design Name: 
// Module Name: Mealy_tb
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


module Mealy_tb();

    reg x; 
    reg clk;
    reg reset; 
    wire out; 
    
    Mealy DUT(.x(x), .reset(reset), .clk(clk), .y(out)); 
    
    //Run clock
    always begin
        #1 clk = ~clk;
    end
    
    //Initial values
    initial begin
        reset = 1;
        clk = 0;
        x = 0;
    end
    
    //Run test cases
    initial begin
        //Test sequence wrong first input
        #2 reset = 0; x = 0; 
        #2 reset = 1; 
        //Wrong second input
        #2 reset = 0; x = 1;
        #2            x = 0; 
        #2 reset = 1;
        //Wrong thrid input
        #2 reset = 0; x = 1; 
        #2            x = 1;
        #2            x = 1; 
        #2 reset = 1;
        //Wrong fourth input
        #2 reset = 0; x = 1;
        #2            x = 1;
        #2            x = 0; 
        #2            x = 0;
        #2 reset = 1;
        //Correct input
        #2 reset = 0; x = 1;
        #2            x = 1;
        #2            x = 0; 
        #2            x = 1;
        #2 $finish; //End of tests
    end
endmodule
