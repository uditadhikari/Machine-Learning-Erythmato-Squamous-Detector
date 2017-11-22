function [expectationTrue, expectationFalse, varianceTrue, varianceFalse] = compute_expect_var(X, y)
%compute the estimation and variance of each feature respectively when the output is true and when false

%initialize the vectors to return
featureNum = size(X, 2);
sampleNum = size(X, 1);

expectationTrue = zeros(featureNum, 1);

disp(expectationTrue);

%{
varianceTrue = zeros(featureNum, 1);
expectationFalse = zeros(featureNum, 1);
varianceFalse = zeros(featureNumt, 1);

%classify X to two matrices according to the output
X1 = zeros(1, featureNum);
X2 = zeros(1, featureNum);

if y(1) == 1,
	X1 = X(1,:);
else
	X2 = X(1,:);
end;
for i = 2:size(y):
	if y(i) == 1
		X1 = [X1; X(i,:)];
	else
		X2 = [X2; X(i,:)];	
	end;
end;
%}
%compute the estimation and variance for each
%expectationTrue = sum(X1) / size(X1, 1);
%varianceTrue = var(X1);
%expectationFalse = sum(X2) / size(X2, 1);
%varianceFalse = var(X2);