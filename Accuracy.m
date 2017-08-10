function [acc] =  Accuracy(csv_file)

% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%-------------------------------------------------------------------

% Check if csv file has only two columns
if size(csv_file,2) > 2
    error('csv file must only have two columns: ground truth and prediction');
else
    number_correct = 0;
    for i = 1:size(csv_file,1)
        if csv_file(i,1) == csv_file(i,2)
            number_correct = number_correct + 1;
        end
    end
    
    acc = number_correct / size(csv_file,1);
end
