function [kappa] = quadraticWeightedKappa(ground_truth, predicted, minRating, maxRating)

% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%-------------------------------------------------------------------

csv_file = [ground_truth(:) predicted(:)];

% Check if csv file has only two columns
if size(csv_file,2) > 2
    error('csv file must only have two columns: ground truth and prediction');
end

if nargin==3
    M = confusionMatrix(csv_file, minRating, maxRating);
else
    M = confusionMatrix(csv_file);
end

[dx,dy] = meshgrid(1:size(M,1),1:size(M,2));
d = (dx-dy).^2 / range(dx(:)).^2;
E = sum(M,2)*sum(M,1);E = E / sum(M(:));

kappa = 1 -(sum(d(:).*M(:))/sum(M(:))) / (sum(d(:).*E(:))/sum(E(:)));


