`timescale 1ns / 1ps

module Counter_tb();

    reg clk; 
    reg reset; 
    wire [11:0] count; //Counter value, one wider to show correct output
    
    Counter DUT(.clk(clk), .reset(reset), .count(count)); 
    
    initial begin
        clk = 0; 
        reset = 1;
    end
    
    always begin
        #0.5 clk = ~clk;
    end
    
    initial begin
        //Wait for enough time to verify counter goes to 4095 and rolls back
        #2 reset = 0; 
        #4100;
        reset = 1; // Pull reset high to demonstrate that count resets
        #20 reset = 0; 
        #100; //Count up some more
        $finish;
    end
endmodule
