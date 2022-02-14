function W10=random_matrix(input_nodes, hidden_neurons)
j=1;
W10=zeros(input_nodes, hidden_neurons);
temp=[ 0 1 1 0 0 0 1 1 0 0 1 0 1 1 0 0;];
fileID = fopen('W10.txt','w');
while j<=hidden_neurons
    i=1;
    while i<=input_nodes
        W10(i,j)=bin_to_dec(temp)/(2^15);
        temp=lfsr(temp);
        i=i+1;
    end
    j=j+1;
end
writematrix(W10, 'W10.txt', 'Delimiter','tab');
fclose(fileID);
end