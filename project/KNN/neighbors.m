% Given a training set this computes and sends the nearest neigbors


% A sample implementation looks like this 

function [neighbors_rows, neighbors_index] = neighbors(X, testInstance, k)
	
  dataLen = size(X,1);
  
  dists = zeros(dataLen,1);
  
  for index = 1 : dataLen
      dists(index) = sqrt(sum((X(index, :) - testInstance).^2));
  end
    
  [dist, ind] = sort(dists);
  
  neighbors_index = ind(1:k);
  
  neighbors_rows = X(neighbors_index,:);

  