`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 22.11.2021
// Module Name: serializer
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module serializer(input [255:0] parallel_data,
  input clk,
  input rx,
  output reg [15:0] serial_data,
  output reg [4:0] count,
  output reg tx);
  reg data_sent;
  reg [255:0] temp_reg;
  always @ (posedge clk) begin
    if (rx) begin
      temp_reg=parallel_data;
      tx=1'b0;
      count=5'd16;
      data_sent=1'b0;
    end
    else if (|count)begin
      tx=1'b1;
      #1 serial_data=temp_reg[255:240];
      temp_reg=temp_reg<<16;
      count=count-1'b1;
    end
    else if ((count==5'd0) & tx) #1 tx=1'b0;
  end
endmodule
