close all
clear all;
clc
rng(1);
%defining constant values, you can change this values
data_size = 10;
order = 3;
%creat and visualize dataset
x = linspace(0,1,data_size);
z = linspace(0,1,100);
y = (sin(2*pi*x) + 0.1*randn(1,10))';
plot(z,sin(2*pi*z))
hold on
scatter(x,y)
hold on
%creating mapping features
X = zeros(data_size,order)
for i = 1:order
    X(:,i) = x.^i;
end
X = [ones(data_size,1) , X];
%solving close form equation for linear regression
W = inv(X'*X)*X'*y;
%evaluation and visualization of calculated model
f=zeros(100,order);
for i=1:order
    f(:,i) = z.^(i);
end

f = [ones(100,1) f];
y_predict = f*W;
plot(z,y_predict)
legend('sin(x)','','model prediction')
title(order)