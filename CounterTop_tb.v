`timescale 1ns / 1ps

module CounterTop_tb();

    reg clk; 
    reg reset; 
    wire [3:0] an; 
    wire [7:0] seg; 
    
    CounterTop DUT(.clk(clk), .reset(reset), .an(an), .seg(seg)); 
    
    initial begin
        clk = 0;
    end
    
    always begin
        #5 clk = ~clk; 
    end
    
    initial begin
        reset = 1; //Reset system
        #25 reset = 0; 
        //Allow system to run
    end
    
    always@(DUT.count) begin 
        if (DUT.count == 2) begin // Simulation to reach 4095 would take a long time, this demonstrates overall module functionality
            #25 reset = 1; 
            #25 reset = 0; 
            #1000 $finish; 
        end
    
    end
endmodule
