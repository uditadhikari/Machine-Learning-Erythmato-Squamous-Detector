# prepare data

  data = load('dermatology.txt');
  X = data(1:280 , 1 : 34);
  y = data(1:280 , 35);
  
  
  
  test_data_without_output = data(281:358,1:34);
  test_data_output_only = data(281:358,35);
  
 
	
	# generate predictions
	predictions=[]
	k = 15 # collecting K most similar points. We pick sqrt(n).
  
  
  for index = 1 : size(test_data_without_output, 1)
		[neighbors, neighbors_index] = getNeighbors(X, test_data_without_output(index, :), k)
		result = voteOnNeighbors(y(neighbors_index, :));
  end
  
    predictions.append(result)
		print('> predicted=' + repr(result) + ', actual=' + repr(test_data_output_only[x]))
	  accuracy = getAccuracy(testSet, predictions)
	  print('Accuracy: ' + repr(accuracy) + '%')
  