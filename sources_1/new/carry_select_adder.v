module carry_select_adder
        (   input [3:0] a, b,
            input c_in,
            output [3:0] sum,
            output c_out
        );
    wire [3:0] temp0,temp1,carry0,carry1;
    
    //for carry 0
    full_adder fa00(a[0],b[0],1'b0,temp0[0],carry0[0]);
    full_adder fa01(a[1],b[1],carry0[0],temp0[1],carry0[1]);
    full_adder fa02(a[2],b[2],carry0[1],temp0[2],carry0[2]);
    full_adder fa03(a[3],b[3],carry0[2],temp0[3],carry0[3]);
    
    //for carry 1
    full_adder fa10(a[0],b[0],1'b1,temp1[0],carry1[0]);
    full_adder fa11(a[1],b[1],carry1[0],temp1[1],carry1[1]);
    full_adder fa12(a[2],b[2],carry1[1],temp1[2],carry1[2]);
    full_adder fa13(a[3],b[3],carry1[2],temp1[3],carry1[3]);
    
    //mux for carry
    multiplexer mux_carry(carry0[3],carry1[3],c_in,c_out);
    //mux's for sum
    multiplexer mux_sum0(temp0[0],temp1[0],c_in,sum[0]);
    multiplexer mux_sum1(temp0[1],temp1[1],c_in,sum[1]);
    multiplexer mux_sum2(temp0[2],temp1[2],c_in,sum[2]);
    multiplexer mux_sum3(temp0[3],temp1[3],c_in,sum[3]);

endmodule 
