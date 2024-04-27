%In this script, I implementing KNN algorithm using iris dataset from
%scrach.
%You can change the values of K and TrainDataPercentage to observe " + ...
%changes in accuracy. However, remember that 
% K < TrainDataPercentage * sample_num
clear all;
clc;
K = 3;
%loading dataset
load fisheriris.mat
sample_num = size(meas,1);
feature_num = size(meas,2);
TrainDataPercentage = 0.6;%proportion of training data
last_train_data = floor(TrainDataPercentage*sample_num);
%shuffle dataset and divide to training and test dataset
rng(12)
indices = randperm(sample_num);
train_data = meas(indices(1:last_train_data),:);
train_target = species(indices(1:last_train_data),:);
test_data = meas(indices(last_train_data+1:sample_num),:);
test_target = species(indices(last_train_data+1:sample_num),:);
%model training
model_prediction = knn_from_scratch(train_data,train_target,K,test_data);
%model evaluation
s = 0;
for i = 1:(sample_num-last_train_data)
    if model_prediction(i) == test_target(i)
        s = s+1;
    end
end    
fprintf("accuracy is %1.3f",s/(sample_num-last_train_data));