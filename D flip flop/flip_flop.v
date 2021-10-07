`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2021 07:02:05
// Design Name: 
// Module Name: flip_flop
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


module flip_flop(D,Q,clk,en);
    input D,clk,en;
    output reg Q;
    always@(posedge clk) 
        if(~en)
            Q=D;
        else
            Q=0;
endmodule
