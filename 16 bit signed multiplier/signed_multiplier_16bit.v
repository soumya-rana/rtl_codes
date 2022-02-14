`timescale 100us / 1ns
///////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 22.10.2021
// Module Name: Shift and add multiplier signed - 16 bit
// Project Name: Multiplier
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module multiplier(input [15:0] A,
               input [15:0] B,
              input clk,
              input en,
              input rst,
               output [31:0] Q,
              output reg flag);
  reg [15:0] D1;
  reg [32:0] D2;
  reg [4:0] iter;
  reg data_ready;
  reg sign;
  assign Q=(sign)?(-D2[31:0]):(D2[31:0]);

  always @ (posedge clk) begin
    if (rst) begin
    D2<=33'd0;
    D1<=16'd0;
    flag<=1'b0;
    data_ready<=1'b0;
    end
    else if (en & ~(data_ready)) begin
      D1<=A[15]?(-A):(A);
      D2[15:0]<=B[15]?(-B):(B);
      sign<=A[15]^B[15];
      D2[32:16]<=17'd0;
      data_ready<=1'b1;
      iter<=5'd16;
    end
    else if ((iter==5'd0)&(data_ready)) begin
      flag<=1'b1;
    end
    else if (D2[0]) begin
      D2[32:16]=D2[32:16]+D1;
      D2=D2>>1;
      iter=iter-1;
    end
    else if (~D2[0]) begin
      D2=D2>>1;
      iter=iter-1;
    end
  end
endmodule
