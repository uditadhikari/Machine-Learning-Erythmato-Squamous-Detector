function plotAccuracyOverK(accuracy_list)
   
  accuracy_list = accuracy_list ./ 100;
  
  % Create New Figure 
  figure; hold on;  

  % Labels and Legend
  xlabel('K');
  ylabel('Accuracy');
  
  %Plot Examples
  for index = 1 : size(accuracy_list, 1)
    plot(index, accuracy_list(index), 'k+', 'LineWidth', 2 , 'MarkerSize', 7);
  end