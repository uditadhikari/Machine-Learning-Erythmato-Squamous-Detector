data = load('dermatology.txt');

X = data(1:280 , 1 : 34);
y = data(1:280 , 35);

test_data_with_output = load('test_instance.txt');
test_data_without_output = data(281:358,1:34);
test_data_output_only = data(281:358,35);

%save prediction.mat prediction;

prediction = naive_bayes_classifier(X, y, test_data_without_output);

%disp("########## Predicted classes for test data are  is #########")
%disp(prediction)
match=0;
nonmatch=0;

% Accuracy of the model 

for i = 1:size(prediction),
  if(prediction(i) == test_data_output_only(i)),
    match++;
  else
    nonmatch++;
  endif
end;

disp("The number of correct predirctions is "),disp(match);
disp("The number of incorrect predirctions is"),disp(nonmatch);
disp("Accuracy percentage is "),disp((match/199)*100);
