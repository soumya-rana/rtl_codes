function [parameters,Ytrain_hat] = ELM_train(X_train,Y_train,hidden_neurons)
% This function trains the ELM model

% Input description:
% X_train, Y_train: Training data and label
% hidden_neurons: #neurons in hidden layer

% Output desciption
% parameters: stores the weight matrices
% Ytrain_hat : predicted one-hot encoded output 

input_nodes =  size(X_train,2);

% input to hidden layer weight random initialization using LFSR logic 
W10=random_matrix(input_nodes, hidden_neurons);       
parameters.W10 = W10;

% hidden layer output
H = ReLU(X_train*W10);

% hidden to output layer weight
W21 = pinv(H)*Y_train;
% conversion of W21 to fixed point 16 bit words with 15 bits precision
parameters.W21 = fixed_point(W21, 'W21.txt');
% prediction from output layer 
Ytrain_hat = H*W21;
Ytrain_hat=(Ytrain_hat==max(Ytrain_hat,[],2));

end