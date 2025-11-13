`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 03:14:14 PM
// Design Name: 
// Module Name: Moore_tb
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




module Moore_tb;
  reg X;
  reg clk;
  wire Y;
  
  
  Moore DUT(.X(X), .clk(clk), .Y(Y));
  
  initial begin
    X = 0; clk = 1;
  end
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    //Start at state A, Transition A-A
    #2 X = 0;
    //Transition A-B
    #2 X = 1;
    //Transition B-A
    #2 X = 0;
    //Transition A-B-C
    #2 X = 1;
    #2 X = 1;
    //Transition C-C (a few times)
    #2 X = 1;
    #2 X = 1;
    #2 X = 1;
    //Transition C-D
    #2 X = 0;
    //Transition D-B
    #2 X = 1;
    //Transition B-C-D-E (complete pattern)
    #2 X = 1;
    #2 X = 0;
    #2 X = 0;
    //Expect Y = 1;
    //Transition E-A-B-C-D-E
    #2 X = 0;
    #2 X = 1;
    #2 X = 1;
    #2 X = 0;
    #2 X = 0;
    //Expect Y = 1;
    //Transition E-B-C-D-E
    #2 X = 1;
    #2 X = 1;
    #2 X = 0;
    #2 X = 0;
    //Expect Y = 1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #48 $finish;
  end
  
endmodule