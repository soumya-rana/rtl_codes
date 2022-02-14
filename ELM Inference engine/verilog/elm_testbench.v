`timescale 1ns/1ps
///////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 15.11.2021
// Module Name: ELM engine testbench
// Project Name: ELM engine
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////

module elm_testbench();
  reg clock=1'b1, set=1'b0;
  wire [255:0] img;
  wire ser_tx;
  wire [4:0] serial_count;
  reg [8:0] index;
  wire [9:0] ans;
  wire [15:0] serial_img;
  wire [12:0] node_index;
  wire [9:0] output_layer;
  serializer SER(img, clock, set, serial_img, serial_count, ser_tx);
  top_module ELM (serial_img, serial_count, clock, ser_tx, set, node_index, output_layer);
  test_images IMG(index,img);
  test_images_answers ANS(index,ans);
  always begin
    #5 clock<=~clock;
  end
  initial begin
    #110 set<=1'b1;
    index<=9'd13;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50 set<=1'b1;
    index<=9'd366;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd51;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd14;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd49;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd120;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd169;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd119;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd23;
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    #50 set<=1'b1;
    index<=9'd129
    #20 set<=1'b0;
    #360;
    while (~(|output_layer)) #10;
    $display("predicted=%b, actual=%b", output_layer, ans);
    #50;
    $finish;
  end
endmodule
