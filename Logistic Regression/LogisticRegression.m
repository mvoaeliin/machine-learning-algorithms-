clear all
clc
%loading the datasets
load actid.mat
load feat.mat
%Here, we want to perform binary classification, so we change the labels
%in a way to have only two labels, namely, 0 and 1, respectively,
%representing whether the target user is still or moving. 
labels = actid(:,1) > 2;
%dataset shufeling
sample_num = size(feat,1);
feature_num = size(feat,2);
feat = [ones(sample_num ,1) feat];
TrainDataPercentage = 0.6;%proportion of training data
last_train_data = floor(TrainDataPercentage*sample_num);
%shuffle dataset and divide to training and test dataset

indices = randperm(sample_num);
train_data = feat(indices(1:last_train_data),:);
train_target = labels(indices(1:last_train_data),:);
test_data = feat(indices(last_train_data+1:sample_num),:);
test_target = labels(indices(last_train_data+1:sample_num),:);
%model training, gradient secsent
alpha = 0.01;
num_iteration = 500;
teta = zeros(feature_num+1,1);
for i=1:num_iteration
    z = train_data*teta;
    y = 1./(1+exp(-z));
    gradientt = train_data'*(y-train_target);
    teta = teta - (alpha/sample_num*TrainDataPercentage)*gradientt;
end
%evaluation
y_p = test_data*teta;
y_pred = 1./(1+exp(-y_p));
y_pred_labels = y_pred > 0.5;
accuracy = sum(y_pred_labels == test_target)/size(test_target,1);
disp(accuracy)




