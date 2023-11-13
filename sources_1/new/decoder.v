module decoder (
    input CLK100MHZ,
	input [11:0] Instruction,
	input ShowOutput, //0 or 1 depending on if u want to show the input (in hex) or show the output from ALU's math
	//output reg [3:0] ToALU_A,
	//output reg [3:0] ToALU_B,
    //output reg [2:0] ToALU_OpCode,
    //output reg LogicMode,
    //output [3:0] ALU_Result, //write code that feeds this to the Segmentdisp
    output [6:0] cathode_out_2d, //7 segments
    output ALU_C_out
 
);

    reg [3:0] ToALU_A;
    reg [3:0] ToALU_B;
	reg [2:0] ToALU_OpCode;
	reg LogicMode;
	reg [3:0] ALU_Result;
	wire [3:0] ALU_result_internal;
    reg [3:0] ToDispOPInstr;
	
	
    reg [3:0] val_to_display = 0; //4 bits since we only display between 0-F Hex or 0-9 decimal
	//reg [7:0] anode_out_2d; //8 digits
	reg reset_in =0; //does nothing for now, should eventually connect to a reset button
	
	always @(Instruction) begin
	    ToALU_A = Instruction[7:4];
        ToALU_B = Instruction[3:0];
        ToALU_OpCode = Instruction[10:8]; //this will be displayed as hex
        LogicMode = Instruction[11];
        ToDispOPInstr = Instruction[11:8]; //only for displaying 4-bit instruction
    end
	
	
    ALU myALU (
        .A3(ToALU_A),
        .B3(ToALU_B),
        .OpCode(ToALU_OpCode),
        .LogicMode(LogicMode),
        .Result3(ALU_result_internal),
        .C_out3(ALU_C_out)
    );
    
    always @(posedge CLK100MHZ) begin
        if (ShowOutput) begin
            val_to_display = {ALU_result_internal};  // Displaying ALU Result as decimal
        end else begin
            val_to_display = {ToDispOPInstr}; //Otherwise, display instruction as hexadecimal
        end
    end
    
    seven_control display_module (
        .val_TBD(val_to_display),
        .clock_in(CLK100MHZ),
        .reset_in(reset_in),
        .cathode_out(cathode_out_2d)
        //.anode_out(anode_out_2d)
    );
    
    
endmodule