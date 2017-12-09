  %% Initialization
  clear ; close all; clc

  data = load('dermatology.txt');
  ##normalize the data;
   
  normalized_data = data(1 : 280, 1 : 34);

  #normalize the data;
  min_data    = min(normalized_data); 
  max_data    = max(normalized_data);
  range_data  = max_data - min_data;
  mean_data   = mean(normalized_data);
  sd_data     = std(normalized_data);
   
   
  # Rescaling
  # normalized_train_data = (normalized_data .- min_data) ./ range_data;
  # normalized_test_data = (data(281:358, 1 : 34) .- min_data) ./ range_data;
   
  # Mean Normalization
  # normalized_train_data = (normalized_data .- mean_data) ./ range_data;
  # normalized_test_data = (data(281:358, 1 : 34) .- mean_data) ./ range_data;

  # Standardization
  normalized_train_data = (normalized_data .- mean_data) ./ sd_data;
  normalized_test_data = (data(281:358, 1 : 34) .- mean_data) ./ sd_data;

  X = normalized_train_data(: , :);
  y = data(1:280 , 35);

  test_data_without_output = normalized_test_data(: , :);
  test_data_output_only = data(281:358 , 35);

  %save prediction.mat prediction;


  prediction = naive_bayes_classifier(X, y, X);

  disp("###############Accuracy of Training Data#################")

  accuracy(prediction, 280 ,y)

  prediction = naive_bayes_classifier(X, y, test_data_without_output);
  
  disp("\n");

  disp("###############Accuracy of Test Data#################")

  accuracy(prediction,(358-280),test_data_output_only);
  
  disp("\n");
