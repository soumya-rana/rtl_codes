function fixed=fixed_point(W21, filename)
n=size(W21);
fixed=zeros(n);
%fixed_bin=zeros(n(1,1), n(1,2), 16);
i=1;
while i<=n(1,1)
    j=1;
    while j<=n(1,2)
        temp=floor(W21(i,j)*2^15)/2^15;            % convert W21 matrix element to fixed point
        fixed(i,j)=temp;
        j=j+1;
    end
    i=i+1;
end
writematrix(fixed, filename, 'Delimiter','tab');  % store W21 matrix in file named 'filename'
convert_to_binary(filename, 'W21_bin.txt');       % convert the matrix W21 to binary and store in W21_bin.txt
end