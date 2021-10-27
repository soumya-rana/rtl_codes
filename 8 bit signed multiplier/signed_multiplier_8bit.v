//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////
// Company: Indian Institute of Science, Bengaluru
// Engineer: Soumya Kanta Rana
//
// Create Date: 26.10.2021
// Module Name: 8 bit signed multiplier
// Project Name: Matrix multiplier
// Target Devices: xc7a200tfbg484-2
//
////////////////////////////////////////////////////////////////////////////////
module multiplier(
  	output reg [15:0] Q,
    output reg [3:0] iter,
    output reg sign,
    input [7:0] A,
    input [7:0] B,
    input clk,
    input S);
    reg [7:0] D1;
    reg [16:0] D2;
  	reg A_sign, B_sign;

    always @(posedge clk) begin
      case(S)
          1'b0: begin
                D1=A;
                D2[7:0]=B;
            	D2[16:8]=9'b000000000;
                iter=4'b0000;
                if (A[7]==1'b1) begin
                    A_sign=1'b1;
                    D1=-D1;
                end else begin
                    A_sign=1'b0;
                end
                if (B[7]==1'b1) begin
                    B_sign=1'b1;
                    D2[7:0]=-D2[7:0];
                end else begin
                    B_sign=1'b0;
                end
                sign=A_sign ^ B_sign;
                end

          1'b1:begin
                  if(D2[0])
                      D2[16:8]=D2[16:8]+D1;
                  D2=D2>>1;
                  iter=iter+1;
               end
      endcase
      if (sign==1'b1)
          Q<=-D2[15:0];
      else
          Q<=D2[15:0];
      end
endmodule
