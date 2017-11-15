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
inputs = data(: , 1 : 34);
output = data(:, 35);

fprintf('\nTraining Multi Class Logistic Regression...\n');

lmb = 0.1;
[all_theta] = oneVsAll(inputs, output, num_class, lmb);

all_theta;

fprintf('Program paused. Press enter to continue.\n');
pause;

pred = predictOneVsAll(all_theta, inputs);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == output)) * 100);
