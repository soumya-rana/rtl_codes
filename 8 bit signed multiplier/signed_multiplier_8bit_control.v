//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 26.10.2021
// Module Name: 8 bit signed multiplier control module
// Project Name: Matrix multiplier
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module multiplier_controller(output reg [15:0] Q,
    output reg flag,
    input [7:0] A,
    input [7:0] B,
    input clk,
    input rst,
    input pause);
    reg S;
    wire sign;
    wire [15:0] P;
    wire [3:0] iter;
    reg [1:0] state, next_state;
    parameter S0=2'b00;
    parameter S1=2'b01;
    parameter S2=2'b10;
  multiplier dut(P, iter,sign, A, B, clk, S);

    // state register logic
    always @ (posedge clk, posedge rst) begin
        if (rst) state<=S0;
        else state<=next_state;
    end

    // next state, control and output logic
    always @ ( * ) begin
        case(state)
            S0: begin
                    S<=1'b0;
                    if (pause) next_state<=S0;
                    else begin
                        next_state<=S1;
                        flag<=1'b0;
                    end
                end
            S1: begin
                    S<=1'b1;
              if (iter==4'b0111) next_state<=S2;
                    else next_state<=S1;
                end
            S2: begin
                    flag<=1'b1;
                    Q<=P;
                    next_state<=S0;
                end
        endcase
    end
endmodule
