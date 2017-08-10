clc
clear 
close all

%-------------------------------------------------------------------
% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%------------------------------------------------------------------

file_ext = '.csv';
groundtruth_files = dir(['/ground_truth_path/*',file_ext]);
groundtruth_path = '/ground_truth_path/';
prediction_path = '/prediction_path/';

% Note: File names in prediction and ground truth must be the same
% Change above paths accordingly and file 
%------------------------------------------------------------------

stats_measure = 'quad_weighted_kappa';

if strcmp(stats_measure,'quad_weighted_kappa') == 1
    quad_kappa = 0;
    stats = {quad_kappa};
elseif strcmp(stats_measure,'hamming_loss') == 1
    hamming = 0;
    stats = {hamming};
elseif strcmp(stats_measure,'accuracy') == 1
    acc = 0;
    stats = {acc};
elseif strcmp(stats_measure,'mean_consequential_error') == 1
    mce = 0;
    stats = {mce};
elseif strcmp(stats_measure,'log_loss') == 1
    log_loss = 0;
    stats = {log_loss};
elseif strcmp(stats_measure,'matthews_correlation_coeff') == 1
    mcc = 0;
    stats = {mcc};
end
%----------------------------------------------------------------
    
for i = 1:length(groundtruth_files)
    file_name = groundtruth_files(i).name;
    disp( sprintf( 'Processing File: %s', file_name ));
    pred_path = [prediction_path,file_name];
    gt_path = [groundtruth_path,file_name];
    
    if strcmp(stats_measure,'quad_weighted_kappa') == 1
        quad_kappa = QuadraticWeightedKappa(gt,prediction);
        stats = {quad_kappa};
    elseif strcmp(stats_measure,'hamming_loss') == 1
        hamming_ = HammingLoss(gt,prediction);
        stats{1} = hamming_ + stats{1};
    elseif strcmp(stats_measure,'accuracy') == 1
        acc_ = Accuracy(gt,prediction);
        stats{1} = acc_ + stats{1};
    elseif strcmp(stats_measure,'mean_consequential_error') == 1
        mce_ = MeanConsequentialError(gt,prediction);
        stats{1} = mce_ + stats{1};
    elseif strcmp(stats_measure,'log_loss') == 1
        logloss_ = LogLoss(gt,prediction);
        stats{1} = logloss_ + stats{1};
    elseif strcmp(stats_measure,'matthews_correlation_coeff') == 1
        mcc_ = MatthewsCorrelationCoefficient(gt,prediction);
        stats{1} = mcc_ + stats{1};
    end

stats

