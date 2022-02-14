clc;
clear all;
close all;

% load the test data: X_test is the image and Y_test is the answer
test_data=load("test_images.txt");
X_test=test_data(:,1:256);
Y_test=test_data(:,257:266);

% load the W10 and W21 values (precomputed for ready use)
W10=load("W10.txt");
W21=load("W21.txt");

% call the ELM_test function to evaluate Y_test_hat
parameters.W10=W10;
parameters.W21=W21;
Y_test_hat= ELM_test(X_test, parameters);

% check test accuracy
test_acc = check_acc(Y_test_hat,Y_test);
