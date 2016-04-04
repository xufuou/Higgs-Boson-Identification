clear all;
clc;

dataset=load('higgs_data.mat');%load data


num_data=size(dataset.higgs_data_for_optimization,1);

[trainInd,valInd,testInd]= dividerand(num_data,0.70,0,0.30);


train_dataset.column_names=dataset.column_names;
train_dataset.higgs_data_for_optimization=dataset.higgs_data_for_optimization(trainInd,:);

test_dataset.column_names=dataset.column_names;
test_dataset.higgs_data_for_optimization=dataset.higgs_data_for_optimization(testInd,:);

save train_dataset.mat -struct train_dataset;
save test_dataset.mat -struct test_dataset;



