function [all_theta] = oneVsAll(X, y, num_labels, lambda)

m = size(X, 1);
n = size(X, 2);
all_theta = zeros(num_labels, n + 1);

X = [ones(m, 1) X];

for index = 1 : num_labels
  
    theta = zeros(n+1, 1);
    
    options = optimset('GradObj', 'on', 'MaxIter', 130);
    
    [thetaVal] = fmincg(@(t)(lrCostFunction(t, X, (y==index), lambda)), ...
                   theta, options);
    
    all_theta(index, :) = thetaVal;


end


end
