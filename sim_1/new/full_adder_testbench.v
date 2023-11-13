`timescale 1ns / 1ps

module full_adder_testbench;
    reg a, b, c_in;
    wire sum, c_out;

    full_adder fadder (a, b, c_in, sum, c_out);

    initial
    begin
      	$dumpfile("dump.vcd");
		$dumpvars;
	    //there are 8 test cases according to truth table
	    $display("a b c s c_out");
        a = 0;
        b = 0;
        c_in = 0;
        #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
        
	    a = 0;
	    b = 0;
	    c_in = 1;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 0;
	    b = 1;
	    c_in = 0;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 0;
	    b = 1;
	    c_in = 1;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 1;
	    b = 0;
	    c_in = 0;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 1;
	    b = 0;
	    c_in = 1;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 1;
	    b = 1;
	    c_in = 0;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);
	
	    a = 1;
	    b = 1;
	    c_in = 1;
	    #10 $display("%b %b %b %b %b", a, b, c_in, sum, c_out);

        #10 $finish;
    end
endmodule