# prepare data

  data = load('dermatology.txt');
  X = data(1:280 , 1 : 34);
  y = data(1:280 , 35);
  test_data_without_output = data(281:358,1:34);
  test_data_output_only = data(281:358,35);
	print 'Train set: ' + repr(len(X))
	print 'Test set: ' + repr(len(test_data_without_output))
	# generate predictions
	predictions=[]
	k = 3 # collecting K most similar points
	for x in range(len(testSet)):
		neighbors = getNeighbors(X, test_data_without_output, k)
		result = getResponse(neighbors)
		predictions.append(result)
		print('> predicted=' + repr(result) + ', actual=' + repr(test_data_output_only[x]))
	accuracy = getAccuracy(testSet, predictions)
	print('Accuracy: ' + repr(accuracy) + '%')