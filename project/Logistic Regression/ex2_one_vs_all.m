  %% Project : Logistic Regression

  % Clear command window
  clear; 
  close all; 
  warning("off","all");
  
  %% Setup initial parameters
  num_inputs = 358;           % nubmer of inputs to the logistic regression algorithm.
  vector_length = 34;         % length of output vector or theta. The length represents the number of rows in the vector. 
  num_class = 6;              % represents the number of diseases we are trying to classify.                          


  % Load Training Data
  fprintf('Loading UCI Dermatology training data....');

  data = load('dermatology.txt');

  #normalize the data;
  normalized_data = data(: , 1 : 34);
  
  min_data    = min(normalized_data); 
  max_data    = max(normalized_data);
  range_data  = max_data - min_data;
  mean_data   = mean(normalized_data);
  sd_data     = std(normalized_data);
 
 
  # Rescaling
  normalized_data = (normalized_data .- min_data) ./ range_data;
 
  # Mean Normalization
  # normalized_data = (normalized_data .- mean_data) ./ range_data;

  # Standardization
  # normalized_data = (normalized_data .- mean_data) ./ sd_data;

  train_inputs = normalized_data(1:280 , :);
  train_output = data(1:280 , 35);
  
  test_inputs = normalized_data(281:358 , :);
  test_output = data(281:358 , 35);

  fprintf('\nTraining Multi Class Logistic Regression...\n');

  num_correct_predictions = 0;
  min_Lambda = 0.001;
  max_Lambda = 100;
  multiplier = 10;
  num_Lambda = log10(max_Lambda) - log10(min_Lambda);
  
  num_Lambda = num_Lambda + 1 # to count for 1;
    
  fprintf('\nNumber of lambda : %i \n', num_Lambda);
    
  training_accuracy_list = zeros(num_Lambda, 1);
  testing_accuracy_list = zeros(num_Lambda, 1);
  
  lmb = min_Lambda;
  index = 1;
  
  while lmb <= max_Lambda
    
    accuracy = 0;
    num_correct_predictions = 0;
      
    [all_theta] = oneVsAll(train_inputs, train_output, num_class, lmb);
        
    pred_train = predictOneVsAll(all_theta, train_inputs);
    pred_test = predictOneVsAll(all_theta, test_inputs);
    
    fprintf('\n\nFor lambda = %i.\n', lmb);
    accuracy = mean(double(pred_train == train_output)) * 100;
    fprintf('Training Set Accuracy: %f\n', accuracy);
    training_accuracy_list(index) = accuracy;
    
    accuracy = mean(double(pred_test == test_output)) * 100;
    fprintf('Test Set Accuracy: %f\n', accuracy);
    testing_accuracy_list(index) = accuracy;
    
    # increament the lambda and counter
    lmb = lmb * 10;
    index = index + 1;
    
  end  
    
  [max_train_accuracy, train_lmb_index] = max(training_accuracy_list);    
  lambda_val = min_Lambda * (10 ^ (train_lmb_index - 1));
  fprintf('Maximum training accuracy %f for lambda = %i\n', max_train_accuracy, lambda_val);
  figureName = "Training Accuracy";
  plotAccuracyOverLambda(figureName, training_accuracy_list, min_Lambda);  
   
    
  [max_test_accuracy, test_lmb_index] = max(testing_accuracy_list);    
  lambda_val = min_Lambda * (10 ^ (test_lmb_index - 1));
  fprintf('Maximum testing accuracy %f for lambda = %i\n', max_test_accuracy, lambda_val);    
  figureName = "Testing Accuracy";
  plotAccuracyOverLambda(figureName, testing_accuracy_list, min_Lambda);  
