`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2021 15:20:33
// Design Name: 
// Module Name: decoder tester
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


module decoder_tester();
    reg [2:0] X;
    wire [7:0] Y;
    decoder_three decode(.X(X), .Y(Y));
    initial
    begin
        X=3'b000;
        #5;
        X=3'b001;
        #5;
        X=3'b010;
        #5;
        X=3'b011;
        #5;
        X=3'b100;
        #5;
        X=3'b101;
        #5;
        X=3'b110;
        #5;
        X=3'b111;
        #5;
        $finish;
    end
endmodule
