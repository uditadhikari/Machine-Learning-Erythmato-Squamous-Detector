
%% Initialization
clear ; close all; clc

# prepare data

  data = load('dermatology.txt');
    
  #normalize the data;
  normalized_data = data(: , 1 : 34);
  
  min_data    = min(normalized_data); 
  max_data    = max(normalized_data);
  range_data  = max_data - min_data;
  mean_data   = mean(normalized_data);
  sd_data     = std(normalized_data);
 
 
  # Rescaling
  # normalized_data = (normalized_data .- min_data) ./ range_data;
 
  # Mean Normalization
  # normalized_data = (normalized_data .- mean_data) ./ range_data;

  # Standardization
    normalized_data = (normalized_data .- mean_data) ./ sd_data;

  X = normalized_data(1:280 , :);
  y = data(1:280 , 35);
  
  test_data_without_output = normalized_data(281:358, :);
  test_data_output_only = data(281:358 , 35);
  	
	# generate predictions
	predictions=[];
	k = 0 # collecting K most similar points. We pick sqrt(n).
  
  num_correct_predictions = 0;
  min_k = 1;
  num_k = 50;
  accuracy_list = zeros(num_k - min_k, 1);
  
  for k = min_k : num_k
    
    accuracy = 0;
    num_correct_predictions = 0;
    total_predictions = size(test_data_without_output, 1);
    
    for index = 1 : size(test_data_without_output, 1)
      [neighbors_rows, neighbors_index] = neighbors(X, test_data_without_output(index, :), k);
      result = vote(y(neighbors_index, :));    
      predictVal = predict(result, test_data_output_only(index, 1));
      num_correct_predictions += predictVal;
    end;
    
    accuracy = (round((num_correct_predictions/total_predictions) * 10000) / 10000) * 100;
    
    accuracy_list(k) = accuracy;

    fprintf('For K = %i train Accuracy is : %f\n', k, accuracy);
  
  end  
  
  [max_accuracy, k_index] = max(accuracy_list);
  
  fprintf('Maximum accuracy %f for K = %i\n', max_accuracy, k_index);
  
  plotAccuracyOverK(accuracy_list);
  
  