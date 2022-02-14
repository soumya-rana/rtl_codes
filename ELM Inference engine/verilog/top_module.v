`timescale 1ns/1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 15.11.2021
// Module Name: output layer calculator
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module top_module(input [15:0] serial_img,
  input [4:0] count,
  input clk,
  input des_set,
  input max_rst,
  output [12:0] node_index,
  output [9:0] max);
  
  wire [255:0] img_rx;
  wire signed [31:0] hidden_node;
  wire input_to_hidden_enable, multiplier_en;
  wire output_layer_flag;
  wire signed [47:0] output_node_01;
  wire signed [47:0] output_node_02;
  wire signed [47:0] output_node_03;
  wire signed [47:0] output_node_04;
  wire signed [47:0] output_node_05;
  wire signed [47:0] output_node_06;
  wire signed [47:0] output_node_07;
  wire signed [47:0] output_node_08;
  wire signed [47:0] output_node_09;
  wire signed [47:0] output_node_10;
  // instantiate the submodules
  deserializer DES(serial_img,count, clk,des_set, img_rx, input_to_hidden_enable);
  input_to_hidden W10(img_rx,clk,input_to_hidden_enable,hidden_node,node_index,multiplier_en);
  hidden_to_output W21(hidden_node,node_index,multiplier_en,max_rst,clk,output_node_01, output_node_02, output_node_03, output_node_04, output_node_05, output_node_06, output_node_07, output_node_08, output_node_09, output_node_10, output_layer_flag);
  max_eval MAX(output_node_01, output_node_02, output_node_03, output_node_04, output_node_05, output_node_06, output_node_07, output_node_08, output_node_09, output_node_10,clk, output_layer_flag, max_rst, max);
endmodule
