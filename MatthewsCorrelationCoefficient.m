function [MCC] =  MatthewsCorrelationCoefficient(csv_file)

% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%-------------------------------------------------------------------

% csv file must only contain 0s and 1s
%-------------------------------------------------------------------

% Check if csv file has only two columns
if size(csv_file,2) > 2
    error('csv file must only have two columns: ground truth and prediction');
else
    tp = 0;
    fp = 0
    tn = 0;
    fn = 0;
    for i = 1:size(csv_file,1)
        if csv_file(i,1) == 0 & csv_file(i,2) == 0
            fp = fp + 1;
        elseif csv_file(i,1) == 0 & csv_file(i,2) == 1
            fn = fn + 1;
        elseif csv_file(i,1) == 1 & csv_file(i,2) == 0
            tn = tn + 1;
        elseif csv_file(i,1) == 1 & csv_file(i,2) == 1
            tp = tp + 1;
        end
    end
    
numerator = tp * tn - fp * fn;
denominator = ((tp + fp) * (fn + tn) * (fp + tn) * (tp + fn))^0.5;
MCC = numerator / denominator;
end

