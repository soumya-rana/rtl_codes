`timescale 1ns/1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 30.10.2021
// Module Name: linear feedback shift register
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module lfsr(input clk,
  input rst,
  output [15:0] Q);
  reg [15:0] D;
  assign Q=D;
  wire feedback=D[15]^D[14]^D[12]^D[3];
  always @ (posedge clk) begin
    if (rst) D<=16'b0110001100101100;
    else begin
      D<=D<<1;
      D[0]<=feedback;
    end
  end
endmodule
