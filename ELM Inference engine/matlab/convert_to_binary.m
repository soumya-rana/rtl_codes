function convert_to_binary(W21, binfile)
% load the text file (name specified in W21 argument)
temp=load(W21);
temp=fi(temp, 1, 16, 15);
% convert to binary (fixed point) with 15 fraction bits
temp=temp.bin;
% write the converted matrix to the text file (name specified in binfile argument)
writematrix(temp, binfile);
end
