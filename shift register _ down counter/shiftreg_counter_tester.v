`timescale 1ms / 1ns
////////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 14.10.2021
// Module Name: Shift register cum down counter
// Project Name: Shift register cum down counter
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module shiftreg_counter_tester ();
    reg d, rst, shift_ena, count_ena;
    reg clk=1'b1;
    wire [3:0] q;
    shiftreg_counter dut(.d(d), .rst(rst), .clk(clk), .shift_ena(shift_ena), .count_ena(count_ena), .q(q));
    always  begin           // clock generator block
        #1 clk=~clk;
    end
    initial begin           // reset, count enable and shift enable block
        #1 rst<=1'b1;
        #2 rst<=1'b0;
        #1 shift_ena<=1'b1;
        #8 shift_ena<=1'b0;
        #4 count_ena<=1'b1;
        #10 count_ena<=1'b0;
        #4;
        $finish;
    end
    initial begin           // data setting block
        #4 d<=1'b1;
        #2 d<=1'b0;
        #4 d<=1'b1;
        #2 d<=1'b0;
        #20;
        $finish;
    end
endmodule
