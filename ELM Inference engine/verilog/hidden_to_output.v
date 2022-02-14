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
module hidden_to_output (input signed [31:0] hidden_node,
  input [12:0] node_index,
  input mult_en,
  input rst, 
  input clk,
  output reg signed [47:0] output_node_01,
  output reg signed [47:0] output_node_02,
  output reg signed [47:0] output_node_03,
  output reg signed [47:0] output_node_04,
  output reg signed [47:0] output_node_05,
  output reg signed [47:0] output_node_06,
  output reg signed [47:0] output_node_07,
  output reg signed [47:0] output_node_08,
  output reg signed [47:0] output_node_09,
  output reg signed [47:0] output_node_10,
  output reg final_flag);

  parameter HIDDEN_NODES=13'd3000;  
  reg addition_done;
  wire [9:0] flags;                   // flags for checking whether the multiplier output is ready
  wire signed [47:0] W2_01;
  wire signed [47:0] W2_02;
  wire signed [47:0] W2_03;
  wire signed [47:0] W2_04;
  wire signed [47:0] W2_05;
  wire signed [47:0] W2_06;
  wire signed [47:0] W2_07;
  wire signed [47:0] W2_08;
  wire signed [47:0] W2_09;
  wire signed [47:0] W2_10;

  wire signed [15:0] rom_01;
  wire signed [15:0] rom_02;
  wire signed [15:0] rom_03;
  wire signed [15:0] rom_04;
  wire signed [15:0] rom_05;
  wire signed [15:0] rom_06;
  wire signed [15:0] rom_07;
  wire signed [15:0] rom_08;
  wire signed [15:0] rom_09;
  wire signed [15:0] rom_10;
  
  // instatiate the ROMs where W21 is stored (10 ROMs - 1 for each column)
  w21_rom1 R01(node_index, clk, rom_01) ;
  w21_rom2 R02(node_index, clk, rom_02) ;
  w21_rom3 R03(node_index, clk, rom_03) ;
  w21_rom4 R04(node_index, clk, rom_04) ;
  w21_rom5 R05(node_index, clk, rom_05) ;
  w21_rom6 R06(node_index, clk, rom_06) ;
  w21_rom7 R07(node_index, clk, rom_07) ;
  w21_rom8 R08(node_index, clk, rom_08) ;
  w21_rom9 R09(node_index, clk, rom_09) ;
  w21_rom10 R10(node_index, clk, rom_10) ;
  
  // instantiate multipliers for performing output layer calculation
  multiplier_32_by_16 M01(rom_01, hidden_node, clk, mult_en, W2_01, flags[9]);
  multiplier_32_by_16 M02(rom_02, hidden_node, clk, mult_en, W2_02, flags[8]);
  multiplier_32_by_16 M03(rom_03, hidden_node, clk, mult_en, W2_03, flags[7]);
  multiplier_32_by_16 M04(rom_04, hidden_node, clk, mult_en, W2_04, flags[6]);
  multiplier_32_by_16 M05(rom_05, hidden_node, clk, mult_en, W2_05, flags[5]);
  multiplier_32_by_16 M06(rom_06, hidden_node, clk, mult_en, W2_06, flags[4]);
  multiplier_32_by_16 M07(rom_07, hidden_node, clk, mult_en, W2_07, flags[3]);
  multiplier_32_by_16 M08(rom_08, hidden_node, clk, mult_en, W2_08, flags[2]);
  multiplier_32_by_16 M09(rom_09, hidden_node, clk, mult_en, W2_09, flags[1]);
  multiplier_32_by_16 M10(rom_10, hidden_node, clk, mult_en, W2_10, flags[0]);

  reg [12:0] current_hidden_node;
  always @ ( posedge clk ) begin
    if ((node_index==13'd0)||(rst)) begin
      output_node_01<=48'd0;               // reset the output nodes at start of calculation 
      output_node_02<=48'd0;
      output_node_03<=48'd0;
      output_node_04<=48'd0;
      output_node_05<=48'd0;
      output_node_06<=48'd0;
      output_node_07<=48'd0;
      output_node_08<=48'd0;
      output_node_09<=48'd0;
      output_node_10<=48'd0;
      final_flag=1'b0;
    end
    else if ((node_index<=HIDDEN_NODES)&(& flags)&(~addition_done)) begin
      output_node_01<=output_node_01+W2_01;   // add hidden node X W21 element and add to corresponding output node
      output_node_02<=output_node_02+W2_02;
      output_node_03<=output_node_03+W2_03;
      output_node_04<=output_node_04+W2_04;
      output_node_05<=output_node_05+W2_05;
      output_node_06<=output_node_06+W2_06;
      output_node_07<=output_node_07+W2_07;
      output_node_08<=output_node_08+W2_08;
      output_node_09<=output_node_09+W2_09;
      output_node_10<=output_node_10+W2_10;
      addition_done<=1'b1;
      final_flag=(node_index==HIDDEN_NODES)?1'b1:1'b0;
    end
    else if (flags==10'd0) begin
      addition_done<=1'b0;                    // flag for preventing addition from happening multiple times
    end
  end
endmodule
