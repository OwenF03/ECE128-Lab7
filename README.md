# ECE128-Lab7
# Owen Funk and David Riley

# Description

The goal of this lab was to write and test two simple FSMs (in both Moore and Mealy styles), and then develop the modules necesary to implement a counter -> seven segment display module for the Basys 3 FPGA. 

# Instructions to Run 

For the state machines, download Moore.v and Mealy.v, and their accompanying test benches. 

For the counter -> seven segment display module, download Counter_Top.v, ClockDivider.v, Counter.v, BCD_SEG.v, COUNT_BCD.v, and Multi_Driver.v

Counter_Top.v, Counter.v, and Count_BCD.v have accompanying testbenches (the files ending in _tb)

To run on the FPGA, download the constraints file and add it to the project, and then generate the bitstream. 
