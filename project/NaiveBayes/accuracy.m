function accuracy = accuracy(prediction,dataset_size,label_data)
%disp("########## Predicted classes for test data are  is #########")
%disp(prediction)
match=0;
nonmatch=0;

% Accuracy of the model 

for i = 1:size(prediction),
  if(prediction(i) == label_data(i)),
    match++;
  else
    nonmatch++;
  endif
end;

disp("The number of correct predirctions is "),disp(match);
disp("The number of incorrect predirctions is"),disp(nonmatch);
disp("Accuracy percentage is "),disp((match/(dataset_size))*100);