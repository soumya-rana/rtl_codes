module counter(Q,clk,rst);
    input clk,rst;
    reg [2:0] X;
    output [2:0] Q;
    always@(posedge clk or posedge rst)
        begin
            if (rst)
                X=3'b000;
            else
                X=X+1'b1;
            end
    assign Q=X;
endmodule
