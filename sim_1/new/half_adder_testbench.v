`timescale 1ns / 1ps

module half_adder_testbench;
    reg a, b;
    wire sum, c_out;

    half_adder half (a, b, sum, c_out);

    initial
    begin
        a = 0;
        b = 0;

        #10 a = 1;
        #10 b = 1;
        #10 a = 0;
        #10 $finish;
    end
endmodule