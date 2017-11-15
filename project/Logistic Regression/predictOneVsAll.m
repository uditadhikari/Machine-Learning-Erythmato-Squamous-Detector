function p = predictOneVsAll(all_theta, X)
  
m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

predictions = sigmoid(X * all_theta');

[predict, index] = max(predictions, [], 2);

p = index;


end
