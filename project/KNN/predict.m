% given the neigbors this function will perform the prediction by taking the class counts of neigbors and 
%emitting the largest count label .

function predictVal = predict(actual_result, correct_result)
	
  if(actual_result == correct_result)
    predictVal = 1;
  else
    predictVal = 0;
  endif
  