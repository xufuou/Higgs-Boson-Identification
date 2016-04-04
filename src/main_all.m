%function main_all() % Main script for testing
clear all;
clc;

%dataset = pr_load('higgs_data.mat', 'the higgs data set');
dataset = pr_load('sampled_data/train_dataset.mat', 'the higgs data set');

tst_dataset = pr_load('sampled_data/test_dataset.mat', 'the higgs data set');

dataset = pr_missing_values(dataset, 'imputation', 'true', 'mean');
tst_dataset = pr_missing_values(tst_dataset, 'imputation', 'true', 'mean');
% dataset = pr_missing_values(dataset, 'imputation', 'true', 'median');
% tst_dataset = pr_missing_values(tst_dataset, 'imputation', 'true', 'median');

dataset = pr_feature_extraction(dataset, 'pca');
%dataset = pr_feature_extraction(dataset, 'lda');

%pr_plot(dataset, 'results-pca-linproj');
%pr_plot(dataset, 'results-pca-eigenvalues');
%pr_plot(dataset, 'results-pca-table');

%[dataset,tst_dataset] = pr_feauture_selection(dataset,tst_dataset,'kruskal-wallis', 17);
%[dataset,tst_dataset]= pr_feauture_selection(dataset,tst_dataset,'ROC', 17);

[dataset,tst_dataset] = pr_feature_selection(dataset, tst_dataset, 'mrMR', 17, 'quotient');
%[dataset,tst_dataset] = pr_feauture_selection(dataset, tst_dataset, 'mrMR', 17, 'subtraction');

%[model,ypred] = pr_classify(dataset,tst_dataset,'KNN',5);
%[model,ypred] = pr_classify(dataset,tst_dataset, 'bayesian');
%[model,ypred] = pr_classify(dataset,tst_dataset, 'SVM');
%[model,ypred]  = pr_classify(dataset,tst_dataset, 'fisher-linear');
[model,ypred]  = pr_classify(dataset,tst_dataset, 'discriminant-quadratic');

[tst_stat,out,cf_mat]= pr_evaluation(ypred,tst_dataset);



