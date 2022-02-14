`timescale 1ns/1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 17.11.2021
// Module Name: maximum number calculator
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module max_eval(input signed [47:0] A,
                input signed [47:0] B,
                input signed [47:0] C,
                input signed [47:0] D,
                input signed [47:0] E,
                input signed [47:0] F,
                input signed [47:0] G,
                input signed [47:0] H,
                input signed [47:0] I,
                input signed [47:0] J,
                input clk,
                input en,
                input rst,
                output reg [9:0] max);
    reg data_ready;
    reg signed [47:0] ram [0:9];
    reg [3:0] max_index;
    reg [3:0] current_index;
    always @ (posedge clk) begin
      if ((en)&(data_ready!=1'b1)) begin
        ram[0]<=A;
        ram[1]<=B;
        ram[2]<=C;
        ram[3]<=D;
        ram[4]<=E;
        ram[5]<=F;
        ram[6]<=G;
        ram[7]<=H;
        ram[8]<=I;
        ram[9]<=J;
        data_ready<=1'b1;
      end
      else if (rst) begin
        ram[0]<=48'd0;
        ram[1]<=48'd0;
        ram[2]<=48'd0;
        ram[3]<=48'd0;
        ram[4]<=48'd0;
        ram[5]<=48'd0;
        ram[6]<=48'd0;
        ram[7]<=48'd0;
        ram[8]<=48'd0;
        ram[9]<=48'd0;
        data_ready<=1'b0;
      end
    end

    always @ (posedge clk) begin
      if (~data_ready) begin
        max<=10'd0;
        max_index<=4'd0;
        current_index<=4'd1;
      end
      else if ((data_ready)&(current_index<4'd10)&(ram[current_index]>ram[max_index])) begin
        max_index<=current_index;
        current_index<=current_index+1'b1;            // if element at current index is more than current maximum, update maximum and move to next element 
      end
      else if ((data_ready)&(current_index<4'd10)&(ram[current_index]<ram[max_index])) begin
        current_index<=current_index+1'b1;            // if element at current index is less than current maximum move to next element
      end
      else if (current_index==4'd10) begin            // provide one hot encoded output
        max[9]<=(max_index==4'd0);
        max[8]<=(max_index==4'd1);
        max[7]<=(max_index==4'd2);
        max[6]<=(max_index==4'd3);
        max[5]<=(max_index==4'd4);
        max[4]<=(max_index==4'd5);
        max[3]<=(max_index==4'd6);
        max[2]<=(max_index==4'd7);
        max[1]<=(max_index==4'd8);
        max[0]<=(max_index==4'd9);
      end
    end
    endmodule
