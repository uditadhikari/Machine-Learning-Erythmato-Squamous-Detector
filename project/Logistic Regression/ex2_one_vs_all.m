%% Project : Logistic Regression

% Clear command window
clear; 
close all; 


%% Setup initial parameters
num_inputs = 358;           % nubmer of inputs to the logistic regression algorithm.
vector_length = 34;         % length of output vector or theta. The length represents the number of rows in the vector. 
num_class = 6;              % represents the number of diseases we are trying to classify.                          


% Load Training Data
fprintf('Loading UCI Dermatology training data....');

data = load('dermatology.txt');

normalized_data = data(: , 1 : 34);

#normalize the data;

min_data    = min(normalized_data);
max_data    = max(normalized_data);
range_data  = max_data - min_data;

normalized_data = (normalized_data .- min_data) ./ range_data;

normalized_data


pause;

train_inputs = normalized_data(1:280 , :);
train_output = data(1:280 , 35);

fprintf('\nTraining Multi Class Logistic Regression...\n');

lmb = 0.1;
[all_theta] = oneVsAll(train_inputs, train_output, num_class, lmb);
fprintf('Program paused. Press enter to continue.\n');
pause;


test_inputs = normalized_data(281:358 , :);
test_output = data(281:358 , 35);

pred_train = predictOneVsAll(all_theta, train_inputs);
pred_test = predictOneVsAll(all_theta, test_inputs);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred_train == train_output)) * 100);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred_test == test_output)) * 100);
