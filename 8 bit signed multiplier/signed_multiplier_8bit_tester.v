//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 26.10.2021
// Module Name: 8 bit signed multiplier testbench
// Project Name: Matrix multiplier
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ps

module multiplier_tester();
  reg [7:0] A,B;
  reg clk=1'b1;
  reg rst=1'b0;
  reg pause=1'b0;
  wire [15:0] Q;
  wire flag;
  multiplier_controller eightbit(.Q(Q), .flag(flag), .A(A), .B(B), .clk(clk), .rst(rst), .pause(pause));
  always begin
      #5 clk=~clk;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #1 rst=1'b1;
    #1 rst=1'b0;
    #1 A=8'b11111001; B=8'b11111001;
    #12 A=8'b00000000; B=8'b00000000;pause=1'b1;
    #160 rst=1'b1;pause=1'b0;A=8'b00001010; B=8'b11111001;
    #5 rst=1'b0;pause=1'b1;
    #160;
    $finish;
  end
endmodule
