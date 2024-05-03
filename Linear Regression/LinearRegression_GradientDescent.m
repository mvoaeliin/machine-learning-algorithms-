close all
clear all
clc
rng(1);
%defining constant values, you can change this values
order=13; %the order of polynomial
data_size=10;%number of data points
step_size = 0.05;%step size of gradient desccent algorithm
itration_num = 100000;%number of times that gradient descent runs
%creat and visualize dataset
x = linspace(0,1,data_size);
z = linspace(0,1,100);
y = (sin(2*pi*x) + 0.1*randn(1,10))';
plot(z,sin(2*pi*z))
hold on
scatter(x,y)
hold on
%creating mapping features
X = zeros(data_size,order);
for i = 1:order
    X(:,i) = x.^i;
end
X = [ones(data_size,1) , X];
%gradient descent algorithm
teta = [1;zeros(order,1)];
for j=1:itration_num
    teta = teta + step_size*(X'*((y - X*teta)));
end
f=zeros(100,order);
for i=1:order
    f(:,i) = z.^(i);
end
%evaluation and visualization of calculated model
f = [ones(100,1) f];
y_predict = f*teta;
plot(z,y_predict)
legend('sin(x)','','model prediction')
title(order)