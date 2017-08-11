function M = confusionMatrix(X, minRating, maxRating)

% Author: Simon Graham
% Tissue Image Analytics Lab
% Department of Computer Science, 
% University of Warwick, UK.
%-------------------------------------------------------------------

%Calculates the confusion matrix between two raters

if nargin==3
    u = minRating:maxRating;
else
    u = min(X(:)):max(X(:));
end
nU = length(u);
M = zeros(nU);

for i=1:nU
    for j=1:nU
        M(i,j) = sum( (X(:,1)==u(i)) + (X(:,2)==u(j)) == 2);
    end
end