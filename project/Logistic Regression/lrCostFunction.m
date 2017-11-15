function [J, grad] = lrCostFunction(theta, X, y, lambda)

m = length(y); 

J = 0;
grad = zeros(size(theta));

predictedVal = sigmoid(X*theta);

shiftedTheta = theta(2:size(theta));

theta_regularized = [0; shiftedTheta];

regularized_term = ((lambda / (2 * m)) * (theta_regularized' * theta_regularized));

J = ((-y)' * log(predictedVal) - (1-y)' * log(1-predictedVal))/m + regularized_term;

grad = (X' * (predictedVal - y) + lambda*regularized_term) / m;


end
