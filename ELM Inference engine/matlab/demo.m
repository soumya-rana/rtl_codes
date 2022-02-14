clc;
clear all;
close all;
indices = [13 366 51 14 49 120 169 119 23 129;];
i=1;
test_data=load("test_images.txt");
tb_imgs=zeros(10,256);
tb_imgs_ans=zeros(10,10);
while i<=10
    tb_imgs(i,:)=test_data(indices(1,i),1:256);
    tb_imgs_ans(i,:)=test_data(indices(1,i),257:266);
    i=i+1;
end
W10=load("W10.txt");
W21=load("W21.txt");
parameters.W10=W10;
parameters.W21=W21;
tb_imgs_ans_hat=ELM_test(tb_imgs, parameters);
test_acc = check_acc(tb_imgs_ans_hat,tb_imgs_ans);
i=1;
while i<=10
    X=["Predicted image: ",max_index(tb_imgs_ans_hat(i,:)),"Actual image: ", max_index(tb_imgs_ans(i,:));];
    disp(X);
    digit = reshape(tb_imgs(i,:),16,16);
    figure;
    imshow(digit);
    i=i+1;
end