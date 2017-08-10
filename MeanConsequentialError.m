function [MCE] =  MeanConsequentialError(csv_file)

% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%-------------------------------------------------------------------

% Check if csv file has only two columns
if size(csv_file,2) > 2
    error('csv file must only have two columns: ground truth and prediction');
else
    number_incorrect = 0;
    for i = 1:size(csv_file,1)
        test_equal = logical(csv_file(i,2)-csv_file(i,1));
        number_incorrect = number_incorrect + test_equal;
        end
    end
    
    MCE = number_incorrect / size(csv_file,1);
end

