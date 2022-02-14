`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 22.11.2021
// Module Name: deserializer
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module deserializer(input [15:0] serial_data,
  input [4:0] count,
  input clk,
  input rx,
  output [255:0] parallel_data,
  output reg tx);
  reg data_set;
  reg [255:0] temp_reg;
  assign parallel_data=temp_reg;
  always @ (posedge clk) begin
    if (rx ) begin
      tx<=1'b0;
      data_set<=1'b0;
      temp_reg<={temp_reg[239:0],serial_data};
    end
    else if (count==0 & ~data_set)begin
      data_set<=1'b1;
      tx<=1'b1;
    end
    else if (data_set & tx) tx<=1'b0;
  end
endmodule
