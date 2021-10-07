module counter_tester();
    reg clk,rst;
    wire [2:0]Q;
    counter dut(.Q(Q),.clk(clk),.rst(rst));
    always
        begin
            clk=0;
            #5;
            clk=1;
            #5;
        end
    initial
        begin
            rst=0;
            #6;
            rst=1;
            #6;
            rst=0;
            #48;
            $finish;
        end
endmodule
