`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2021 20:21:24
// Design Name: 
// Module Name: tester
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


module tester();
    reg A,B,C;
    wire S,Co;
    full_adder cwd(.A(A),.B(B),.C(C),.S(S),.Co(Co));
    initial
    begin
        A = 1'b1; B = 1'b0; C = 1'b0;
        #10
        A = 1'b0; B = 1'b1; C = 1'b1;
        #10
        $finish;
    end
endmodule

