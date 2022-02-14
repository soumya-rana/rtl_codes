% This is the top file.
clc;
clear all;
close all;


%% Load data
data = load('semeion.txt');
X = data(:,1:256);
Y = data(:,257:end);

% Training data
X_train = X(1:1100,:);
Y_train = Y(1:1100,:);

% Testing data
X_test = X(1101:end,:);
Y_test = Y(1101:end,:);

% write test images to a text file
writematrix(string([X_test, Y_test]), 'test_images.txt');
% Hidden layer neurons
% Tweak it for optimization
hidden_neurons =3000;

% Training the model
[parameters, Ytrain_hat]= ELM_train(X_train,Y_train,hidden_neurons);
% Check training accuracy
train_acc = check_acc(Ytrain_hat,Y_train);

% Testing the model
Ytest_hat= ELM_test(X_test, parameters);
% Check training accuracy
test_acc = check_acc(Ytest_hat,Y_test);


%To show the the handwritten digit
digit = reshape(X(225,:),16,16);
imshow(digit)







