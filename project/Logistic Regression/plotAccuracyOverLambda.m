function plotAccuracyOverLambda(figureName, accuracy_list, min_Lambda)
   
  accuracy_list = accuracy_list ./ 100;
  
  % Create New Figure 
  figure('name', figureName);
  hold on;  
  
  % Labels and Legend
  xlabel('lambda');
  ylabel('Accuracy');
  
  %Plot Examples
  
  accuracy_list_len = size(accuracy_list, 1)
  index = 1;
  
  while index <=  accuracy_list_len
    lambda = min_Lambda * (10 ^ (index - 1));
    loglog(lambda, accuracy_list(index), 'k+', 'LineWidth', 2 , 'MarkerSize', 7); # plots on log scale
    index = index + 1;
  end
  