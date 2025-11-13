`timescale 1ns / 1ps

module Counter_tb();

    reg clk; 
    reg reset; 
    reg dvd_out; //Clock divider output

    wire [11:0] count; //Counter value, one wider to show correct output
    
    //ClockDivider dvd(.clock_in(clk), .reset(reset), .clock_out(dvd_out)); //Not used in this TB in order to speed it up, logic is same as below always block
    Counter DUT(.clk(clk), .en(dvd_out), .reset(reset), .count(count)); 
    
    
    initial begin
        clk = 0; 
        reset = 1;
        #5 reset = 0; 
    end
    
    always begin //Fast main clock (like 100 MHz system clock)
        #0.25 clk = ~clk;
    end
    
    //Exact same logic, but with a 2 bit rather than 24 bit counter 
    //ClockDivider dvd(.clock_in(clk), .reset(reset), .clock_out(dvd_out)); //Not used in this TB in order to speed it up, logic is same as below always block
    reg [1:0] counter; 
    always @(posedge clk or posedge reset) begin // Slower enable signal, in this case driven by a 2 bit clock divider enable signal, same logic as ClockDivider
        if(reset) begin
            counter <= 0; 
            dvd_out <= 1; //Goes to zero in actual module 
        end
        else begin
            
            if(counter == 3) begin
                dvd_out <= 1; //Single enable pulse
                counter <= 0; 
            end else begin
                counter <= counter + 1;
                dvd_out <= 0;
            end
        end
    end
    
    
    always @(count) begin
        if(count == 4095) begin //max value
            #5; // Show that it rolls over correcty 
            reset = 1;
            # 10; //Reset
            $finish; 
        end
    end
    
endmodule
