`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2021 07:49:34
// Design Name: 
// Module Name: osc
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


module osc(clock);
    output reg clock;
    integer delay;
    always begin
        clock=0;
        #6;
        clock=1;
        #6;
    end
endmodule
