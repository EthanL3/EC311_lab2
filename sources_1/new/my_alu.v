`timescale 1ns / 1ps

module ALU (
    input [3:0] A3,
    input [3:0] B3,
    input [2:0] OpCode,
    input LogicMode,
    output C_out3,
    output reg [3:0] Result3
);

    wire [3:0] sum_out;
    reg [3:0] B_new;
    reg c_in_new;

    //calls carry select adder - our new adder for lab2
    carry_select_adder my_csa (
        .c_in(c_in_new),
        .a(A3),
        .b(B_new),
        .sum(sum_out),
        .c_out(C_out3)
    );

    //a bunch of logical operators
    always @(OpCode, A3, B3, LogicMode, sum_out) begin
        if (~LogicMode) begin
            case(OpCode)
                3'b000: Result3 = A3 & B3;
                3'b001: Result3 = A3 | B3;
                3'b010: Result3 = ~(A3 & B3);
                3'b011: Result3 = ~(A3 | B3);
                3'b100: Result3 = A3 ^ B3;
                3'b101: Result3 = ~(A3 ^ B3);
                3'b110: Result3 = ~A3;
                3'b111: Result3 = ~B3;
            endcase
        end else begin
            B_new = B3;
            c_in_new = 0;
            //a bunch of math and setting up for the carry select adder to do its job
            case(OpCode)
                3'b000: Result3 = ~A3; // Negate A
                3'b001: Result3 = ~B3; // Negate B
                3'b010: Result3 = sum_out; // A+B
                3'b011: begin // A-B
                    B_new = ~B3;
                    c_in_new = 1'b1;
                    Result3 = sum_out;
                end
                3'b100: begin // A*B - going to be really truncated for big numbers since outputs only 4-bit
                    Result3 = A3 * B3;
                end
                3'b101: begin // B-A
                    B_new = B3 + ~A3 + ~A3; //simple way is to subtract B-2A then let carry select add 1A back to get B-A
                    c_in_new = 1'b1;
                    Result3 = B3-A3;
                end
                3'b110: begin // A+1
                    B_new = 1'b1;
                    Result3 = sum_out;
                end
                3'b111: begin // A-1
                    B_new = ~4'b0001;
                    c_in_new = 1'b1;
                    Result3 = sum_out;
                end
            endcase
        end
    end

endmodule
