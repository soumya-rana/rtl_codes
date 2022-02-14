function dec=bin_to_dec(bin)
% bin is the signed binary number being provided as 1X16 array, bin(1,1) being the MSB
i=1;
dec=0;
while i<=16
    if bin(1,i)==1
        dec=dec+2^(16-i);
    end
    i=i+1;
end
% since the number is signed the MSB has a weight of -2^15
dec=dec-bin(1,1)*2^16;
end
