`timescale 1ns / 1ps

module ALU_testbench;

    reg [3:0] A3_tb;
    reg [3:0] B3_tb;
    reg [2:0] OpCode_tb;
    reg LogicMode_tb;
    wire C_out3_tb;
    wire [3:0] Result3_tb;

    ALU myALU (
        .A3(A3_tb),
        .B3(B3_tb),
        .OpCode(OpCode_tb),
        .LogicMode(LogicMode_tb),
        .C_out3(C_out3_tb),
        .Result3(Result3_tb)
    );

    initial begin
        //$dumpfile("alu_test.vcd");
        //$dumpvars(0, ALU_tb);

        // arithmetic tests //
        LogicMode_tb = 1;
        
        //A+B
        A3_tb = 4'b0010;//2
        B3_tb = 4'b0011;//3
        OpCode_tb=3'b010; //add
        #10 //result3 should be 5

        //A-B
        A3_tb = 4'b0110; //6
        B3_tb = 4'b0010; //2
        OpCode_tb = 3'b011;
        #10; //result3 should be 4

        //A*B
        A3_tb = 4'b0010; // 2
        B3_tb = 4'b0011; // 3
        OpCode_tb = 3'b100;
        #10; // result3 should be 6

        //B - A
        A3_tb = 4'b0010; // 3
        B3_tb = 4'b0011; // 2
        OpCode_tb = 3'b101;
        #10; // result3 should be 1

        //A + 1
        A3_tb = 4'b0100; // 4
        OpCode_tb = 3'b110;
        #10; // result3 should be 5

        //A - 1
        A3_tb = 4'b0101; // 5
        OpCode_tb = 3'b111;
        #10; // result3 should be 4
        
        
        
        // logical tests //
        LogicMode_tb = 0;
        
        //A AND B
        A3_tb = 4'b0101; // 5
        B3_tb = 4'b1100; // 12
        OpCode_tb = 3'b000;
        #10; // result3 should be 4 (0100 in binary)

        //A OR B
        A3_tb = 4'b0101; // 5
        B3_tb = 4'b1100; // 12
        OpCode_tb = 3'b001;
        #10; // result3 should be 13 (1101 in binary hex:D)

        //A XOR B
        A3_tb = 4'b0110; // 6
        B3_tb = 4'b1100; // 12
        OpCode_tb = 3'b100;
        #10; // result3 should be 10 (1010 in binary hex:A)

        //A'
        A3_tb = 4'b0110; // 6, B doesnt matter
        OpCode_tb = 3'b110;
        #10; // result3 should be 9 (1001 in binary)

        $finish;
    end

endmodule
