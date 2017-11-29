train_data = load('train_instance.txt');

X = train_data(1:200 , 1 : 34);
y = train_data(1:200 , 35);

train_data_with_output = load('test_instance.txt');
train_data_without_output = test_data(1:199,1:34);
train_data_output_only = test_data(1:199,35);

%save prediction.mat prediction;

prediction = naive_bayes_classifier(X, y, train_data_without_output);

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
