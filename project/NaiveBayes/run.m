%% Initialization
clear ; close all; clc

data = load('dermatology.txt');
##normalize the data;
 
normalized_data = data(: , 1 : 34);


min_data    = min(normalized_data); 
max_data    = max(normalized_data);
range_data  = max_data - min_data;
 
normalized_data = (normalized_data .- min_data) ./ range_data;


X = normalized_data(1:280 , 1 : 34);
y = data(1:280 , 35);

test_data_without_output = normalized_data(281:358,1:34);
test_data_output_only = data(281:358,35);

%save prediction.mat prediction;


%calculating the accuracy of the training data




prediction = naive_bayes_classifier(X, y, test_data_without_output);

disp("###############Accuracy of Test Data#################")

accuracy(prediction,(358-281),test_data_output_only)


prediction = naive_bayes_classifier(X, y, X);

disp("###############Accuracy of Training Data#################")

accuracy(prediction,(280-1),y)



