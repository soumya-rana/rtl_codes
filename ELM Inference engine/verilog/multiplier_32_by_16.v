`timescale 1ns/1ps
///////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 16.11.2021
// Module Name: Shift and add multiplier signed - 32 bit by 16 bit
// Project Name: Multiplier
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module multiplier_32_by_16(input [15:0] A,
                  input [31:0] B,
              input clk,
              input en,
              output reg [47:0] Q,
              output reg flag);
  reg [31:0] D1;
  reg [64:0] D2;
  reg [5:0] iter;
  reg sign;

  always @ (posedge clk) begin
   if (en) begin                               // if en=1 read data
      D1[15:0]=A[15]?(-A):(A);
      D1[31:16]=16'd0;
      D2[31:0]=B[31]?(-B):(B);
      sign=A[15]^B[31];                       // perform unsigned multiplication after pre-computing the sign
      D2[64:32]=33'd0;
      iter=6'd32;
      flag=1'b0;
      Q=48'd0;
    end
    else if (iter==6'd0) begin
      flag=1'b1;
      Q=(sign)?(-D2[47:0]):(D2[47:0]);
    end
    else if (D2[0]) begin
      D2[64:32]=D2[64:32]+D1;                  // if lsb of D2 is 1 perform addition and right shift
      D2=D2>>1;
      iter=iter-1;
    end
    else if (~D2[0]) begin
      D2=D2>>1;                                // if lsb of D2 is 1 perform  right shift
      iter=iter-1;
    end
  end
endmodule
