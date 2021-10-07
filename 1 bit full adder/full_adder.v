`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
// 
// Create Date: 06.10.2021 20:30:52
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    output S,
    output Co,
    input A,
    input B,
    input C);
    //wire A,B,C,S,Co;
    assign S=(A^B)^C;
    assign Co=(A&B)|(B&C)|(C&A);
endmodule
