`timescale 1ms / 1ns
////////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 14.10.2021
// Module Name: Shift register cum down counter
// Project Name: Shift register cum down counter
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module shiftreg_counter (input d,
    input rst,
    input clk,
    input shift_ena,
    input count_ena,
    output reg [3:0] q);

always @ ( posedge clk or posedge rst ) begin
    if (rst) q=4'b0000;
    else if (shift_ena) begin
        q[0]<=d;
        q[1]<=q[0];
        q[2]<=q[1];
        q[3]<=q[2];
    end
    else if (count_ena) begin
        q<=q-1'b1;
    end
end
endmodule
