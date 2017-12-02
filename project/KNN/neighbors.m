% Given a training set this computes and sends the nearest neigbors


% A sample implementation looks like this 

function [neighbors, neighbors_index] = getNeighbors(X, testInstance, k)
	
  dataLen = size(X,1);
  
  dists = zeros(dataLen,1);
  
  for index = 1 : dataLen
      distances(index) = sqrt(sum((X(index, :) - testInstance).^2));
  end
    
  [dist, ind] = sort(dists);
  
  neighbors_index = ind(1:k);
  
  neighbors = X(neighbors_index,:);

  