function [expectationTrue, expectationFalse, varianceTrue, varianceFalse] = compute_expectation_var(X, y)
%compute the estimation and variance of each feature respectively when the output is true and when false

%initialize the vectors to return
featureNum = size(X, 2);
sampleNum = size(X, 1);

%initialize expectation and variance for the six different classes.

expectation_Psoriasis = zeros(featureNum, 2);
variance_Psoriasis = zeros(featureNum, 1);
expectation_Seboreic = zeros(featureNum, 2);
variabce_Seboreic  = zeros(featureNum, 2);
expectation_Lichen =  zeros(featureNum, 2);
variance_Lichen =zeros(featureNum, 2);
expectation_PityriasisRosea =  zeros(featureNum, 2);
variance_PityriasisRosea =zeros(featureNum, 2);
expectation_Cronicdermatitis= zeros(featureNum, 2);
variance_Cronicdermatitis= zeros(featureNum, 2);
expectation_PityriasisRubraPilaris= zeros(featureNum, 2);
variance_PityriasisRubraPilaris= zeros(featureNum, 2);

%classify X to Six matrices according to the output
psoriais = zeros(1, featureNum);
seboreic = zeros(1, featureNum);
lichen =  zeros(1, featureNum);
ptyriasisRosea=zeros(1, featureNum);
cronisdermatitis = zeros(1, featureNum);
pityriasisRubraPilaris = zeros(1, featureNum);




if y(1) == 1,
	psoriais = X(1,:);
else if(y(1) == 2)
	seboreic = X(1,:);
else if(y(1) == 3)
	lichen = X(1,:);
else if(y(1) == 4)
	ptyriasisRosea = X(1,:);
else if(y(1) == 5)
	cronisdermatitis = X(1,:);
else if(y(1) == 6)
	pityriasisRubraPilaris = X(1,:); 
end;






for i = 2:size(y),
	if y(i) == 1,
		psoriais = [psoriais; X(i,:)];
	else if(y(1) == 2)
		seboreic = [seboreic; X(i,:)];
  else if(y(1) == 3)
		lichen = [lichen; X(i,:)];
  else if(y(1) == 4)
		ptyriasisRosea = [ptyriasisRosea; X(i,:)];
  else if(y(1) == 5)
		cronisdermatitis = [cronisdermatitis; X(i,:)]; 
  else if(y(1) == 6)
		pityriasisRubraPilaris = [pityriasisRubraPilaris; X(i,:)]; 
  end;
end;

%compute the estimation and variance for each of the six categories
expectationTrue = sum(X1) / size(X1, 1);
varianceTrue = var(X1);
expectationFalse = sum(X2) / size(X2, 1);
varianceFalse = var(X2);