fid=open('test_images.txt', 'r');
A=list()
for line in fid:
    A.append(line.rstrip().split(','))
data=list()
for item in A:
    i=0
    string=""
    while i<256:
        string=string+item[i]
        i=i+1
    data.append(string)
fID=open('test_images.v', 'w')
fID.write("///////////////////////////////////////////////////////////////////////////////\n// Company: Indian Institute of Science, Bengaluru \n// Engineer: Soumya Kanta Rana \n//\n// Create Date: 17.11.2021\n// Module Name: images ROM\n// Project Name: ELM engine\n// Target Devices: xc7a200tfbg484-2\n//\n////////////////////////////////////////////////////////////////////////////////\n")
fID.write("module test_images"+"(input [8:0] addr,  output reg [255:0] data);\n")
i=1
fID.write("  always @ (addr) begin \n")
fID.write("     case(addr)\n")
for item in data:
   fID.write('      '+'9'+"'"+'d'+str(i)+": data <=256'b")
   fID.write(item)
   fID.write('; \n')
   i+=1
fID.write("      default: data<=256'd0;\n")
fID.write("    endcase \n")
fID.write("  end \n")
fID.write("endmodule \n")
fID.close()

fid=open('test_images.txt', 'r');
A=list()
for line in fid:
    A.append(line.rstrip().split(','))
data=list()
for item in A:
    i=256
    string=""
    while i<266:
        string=string+item[i]
        i=i+1
    data.append(string)
fID=open('test_images_answers.v', 'w')
fID.write("///////////////////////////////////////////////////////////////////////////////\n// Company: Indian Institute of Science, Bengaluru \n// Engineer: Soumya Kanta Rana \n//\n// Create Date: 17.11.2021\n// Module Name: images ROM answers\n// Project Name: ELM engine\n// Target Devices: xc7a200tfbg484-2\n//\n////////////////////////////////////////////////////////////////////////////////\n")
fID.write("module test_images_answers"+"(input [8:0] addr,  output reg [9:0] data);\n")
i=1
fID.write("  always @ (addr) begin \n")
fID.write("     case(addr)\n")
for item in data:
   fID.write('      '+'9'+"'"+'d'+str(i)+": data <=10'b")
   fID.write(item)
   fID.write('; \n')
   i+=1
fID.write("      default: data<=10'd0;\n")
fID.write("    endcase \n")
fID.write("  end \n")
fID.write("endmodule \n")
fID.close()
