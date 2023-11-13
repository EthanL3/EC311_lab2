`timescale 1ns / 1ps

module tb_decoder;

    reg CLK100MHZ;
    reg [11:0] test_instruction;
    reg ShowOutput;
    wire [3:0] ToALU_A; 
    wire [3:0] ToALU_B;
    wire [2:0] ToALU_OpCode;
    wire LogicMode;

    decoder myDecoder(
        .CLK100MHZ(CLK100MHZ),
        .Instruction(test_instruction),
        .ShowOutput(ShowOutput),
        .ToALU_A(ToALU_A),
        .ToALU_B(ToALU_B),
        .ToALU_OpCode(ToALU_OpCode),
        .LogicMode(LogicMode)
    );

    initial begin
        //i want to use same clock in sim as the real life clock on the FPGA
        CLK100MHZ = 0;
        forever #5 CLK100MHZ = ~CLK100MHZ;
    end

    initial begin
        $monitor($time, " Instr:%h ShowOutput:%b ToALU_A:%b ToALU_B:%b OpCode:%b LogicMode:%b", 
                 test_instruction, ShowOutput, ToALU_A, ToALU_B, ToALU_OpCode, LogicMode);


        ShowOutput = 0; //disps instruction

        test_instruction = 12'hABC; //just a random 12 bit instruction (in hex form)
        #10;

        test_instruction = 12'hFFF;
        #10;

        ShowOutput = 1; //disps alu result

        test_instruction = 12'h123;
        #10;

        test_instruction = 12'h4B6;
        #10;

        $finish;
    end

endmodule
