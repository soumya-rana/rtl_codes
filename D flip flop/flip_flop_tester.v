`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2021 07:27:26
// Design Name: 
// Module Name: flip_flop_tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flip_flop_tester();
    reg D,en;
    wire Q,clk,clock;
    flip_flop dut(.D(D),.Q(Q),.clk(clk),.en(en));
    osc driver(.clock(clock));
    assign clk=clock;
    initial
    begin
        D=1'b0; en=1'b0;
        #10
        D=1'b1; en=1'b0;
        #10
        D=1'b1; en=1'b1;
        #20
        $finish;
    end
endmodule
