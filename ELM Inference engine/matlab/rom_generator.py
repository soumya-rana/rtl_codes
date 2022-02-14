string="W21_bin.txt"
fID=open(string, 'r')
data=list()
for line in fID:                                             # load the W21 matrix in A - dimension hidden_nodes X 256
    A=line.rstrip().split()
    data.append(A)
fID.close()
j=1
while j<=10:                                                 # create verilog code of 10 ROM files W21_1-W21_10
    string="W21_"+str(j)+".v"
    fID=open(string, 'w')                                    # open verilog code of ROM file W21_j
    fID.write("`timescale 1ns/1ps \n\n")
    fID.write("///////////////////////////////////////////////////////////////////////////////\n// Company: Indian Institute of Science, Bengaluru \n// Engineer: Soumya Kanta Rana \n//\n// Create Date: 17.11.2021\n// Module Name: ROMs for W21 \n// Project Name: ELM engine\n// Target Devices: xc7a200tfbg484-2\n//\n////////////////////////////////////////////////////////////////////////////////\n")
    fID.write("module w21_rom"+str(j)+"(input [12:0] addr, input clk,  output reg [15:0] data);\n")
    i=0
    fID.write("  always @ ( posedge clk ) begin \n")
    fID.write("     case(addr)\n")
    for item in data:
        fID.write('      '+'13'+"'"+'d'+str(i)+": data <=16'b")  # write the column corresponding to the j-th ROM file
        fID.write(item[j-1])
        fID.write('; \n')
        i+=1
    fID.write("      default: data<=13'd0;\n")
    fID.write("    endcase \n")
    fID.write("  end \n")
    fID.write("endmodule \n")
    fID.close()
    j+=1
