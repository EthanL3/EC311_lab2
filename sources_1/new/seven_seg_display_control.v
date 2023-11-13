`timescale 1ns / 1ps

module seven_control (
	input [4:0] val_TBD, //to be displayed is a 4-bit value
	input clock_in,
	input reset_in,
	output reg [6:0] cathode_out //7 segments
	//output reg [7:0] anode_out
);

    reg [6:0] seg_map;

    always @(val_TBD, clock_in, reset_in) begin
        case(val_TBD)
            4'h0: seg_map = 7'b1000000;  // 0
            4'h1: seg_map = 7'b1111001;  // 1
            4'h2: seg_map = 7'b0100100;  // 2
            4'h3: seg_map = 7'b0110000;  // 3
            4'h4: seg_map = 7'b0011001;  // 4
            4'h5: seg_map = 7'b0010010;  // 5
            4'h6: seg_map = 7'b0000010;  // 6
            4'h7: seg_map = 7'b1111000;  // 7
            4'h8: seg_map = 7'b0000000;  // 8
            4'h9: seg_map = 7'b0010000;  // 9
            4'hA: seg_map = 7'b0001000;  // A
            4'hB: seg_map = 7'b0000011;  // B
            4'hC: seg_map = 7'b1000110;  // C
            4'hD: seg_map = 7'b0100001;  // D
            4'hE: seg_map = 7'b0000110;  // E
            4'hF: seg_map = 7'b0001110;  // F
        endcase
    end

    //good practive to add a reset, but we are not currently connecting it to anything
    always @(posedge clock_in or posedge reset_in) begin
        if (reset_in) begin
            cathode_out <= 7'b1111111; //Turns off all segments
        end else begin
            cathode_out <= seg_map;
        end
    end

	
    
endmodule