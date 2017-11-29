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
train_inputs = data(1:280 , 1 : 34);
train_output = data(1:280 , 35);

fprintf('\nTraining Multi Class Logistic Regression...\n');

lmb = 0.1;
[all_theta] = oneVsAll(train_inputs, train_output, num_class, lmb);


fprintf('Program paused. Press enter to continue.\n');
pause;


test_inputs = data(281:358 , 1 : 34);
test_output = data(281:358 , 35);
pred = predictOneVsAll(all_theta, test_inputs);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == test_output)) * 100);
