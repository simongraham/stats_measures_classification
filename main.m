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
groundtruth_file = '/Users/simongraham/Desktop/test_gt_results.csv';
csv_split = strsplit(groundtruth_file,'/');
csv_name = csv_split(end)
csv_file = dlmread(groundtruth_file);

% Change above paths accordingly
%------------------------------------------------------------------

stats_measure = 'quad_weighted_kappa';

if strcmp(stats_measure,'quad_weighted_kappa') == 1
    quad_kappa = 0;
    stats = {quad_kappa};
elseif strcmp(stats_measure,'accuracy') == 1
    acc = 0;
    stats = {acc};
elseif strcmp(stats_measure,'mean_consequential_error') == 1
    mce = 0;
    stats = {mce};
elseif strcmp(stats_measure,'matthews_correlation_coeff') == 1
    mcc = 0;
    stats = {mcc};
end
%----------------------------------------------------------------
    
disp( sprintf( 'Processing File: %s', csv_name{1}));

if strcmp(stats_measure,'quad_weighted_kappa') == 1
    quad_kappa = QuadraticWeightedKappa(csv_file(:,1),csv_file(:,2),0,1);
    stats = {quad_kappa};
elseif strcmp(stats_measure,'accuracy') == 1
    acc_ = Accuracy(csv_file);
    stats{1} = acc_ + stats{1};
elseif strcmp(stats_measure,'mean_consequential_error') == 1
    mce_ = MeanConsequentialError(csv_file);
    stats{1} = mce_ + stats{1};
elseif strcmp(stats_measure,'matthews_correlation_coeff') == 1
    mcc_ = MatthewsCorrelationCoefficient(csv_file);
    stats{1} = mcc_ + stats{1};
end

stats

