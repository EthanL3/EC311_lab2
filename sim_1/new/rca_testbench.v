`timescale 1ns / 1ps

module testbench_ripple_carry_adder;

  // Declare signals for testbench
  reg [2:0] A, B;     // 3-bit inputs A and B
  wire [2:0] Sum;     // 3-bit sum output
  wire Cout;          // Carry-out
  reg Cin;

 

  // Instantiate the 3-bit ripple carry adder module
  ripple_carry_adder rca (
    .c_in(Cin),
    .a(A),
    .b(B),
    .sum(Sum),
    .c_out(Cout)
  );

  // Testbench stimulus
  initial begin
    $display("A   B   Cin Cout Sum");

    // Test case 1: A=3 (011), B=2 (010)
    A = 3'b011;
    B = 3'b010;
    Cin = 0;
    
    #10 $display("%b %b %b %b %b", A, B, Cin, Cout, Sum);

    // Test case 2: A=5 (101), B=6 (110)
    A = 3'b001;
    B = 3'b010;
    Cin = 0;
    
    
    #10 $display("%b %b %b %b %b", A, B, Cin, Cout, Sum);
    

    // Add more test cases as needed

    $finish; // End simulation
  end

endmodule