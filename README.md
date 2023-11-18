# ec311_lab2

James Conlon
Ethan Levine

EC311 Lab2

For this lab, we used the decoder.v as the top level module which passes the outputs to the 7 segment display and takes 
the inputs from 12-bit instruction, 1-bit displaymode, and clock. 

Our new adder for this lab is a carry select adder, which we implemented in a similar way to the ripple carry adder (from lab 1) in the ALU file.

We also used the alu_testbench as the primary testbench for the lab, with specific testcases defined in the comments of the file. (including expected output)
All the other testbenches were used while developing each module but for the final waveform we showed the TA, we only used alu_testbench. 


We also created a seperate module to drive the 7-segment display. Note we commented out some files intended for driving multiple digits, however that
is not fully implemented since it was not required for this lab to drive multiple digits

The ALU saninitizes inputs before they get sent to the carry select adder and the ALU also performs the logical operations.
