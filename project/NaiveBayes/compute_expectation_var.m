function [expectation_Psoriasis, expectation_Seboreic, expectation_Lichen, expectation_ptyriasisRosea,expectation_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_Psoriasis,variance_Seboreic,variance_Lichen,variance_ptyriasisRosea,variance_expectation_cronisdermatitis,variance_pityriasisRubraPilaris] = compute_expectation_var(X, y)
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


psoriasis_index = find(y == 1);
psoriais = X(Psoriasis_index, :);

seboreic_index = find(y == 2);
seboreic = X(seboreic_index, :);

lichen_index = find(y == 3);
lichen = X(lichen_index, :);

ptyriasisRosea_index = find(y == 4);
ptyriasisRosea = X(ptyriasisRosea_index, :);

cronisdermatitis_index = find(y == 5);
cronisdermatitis = X(cronisdermatitis_index, :);

pityriasisRubraPilaris_index = find(y == 6);
pityriasisRubraPilaris = X(pityriasisRubraPilaris_index, :);

%compute the estimation and variance for each of the six categories.
expectation_Psoriasis = sum(psoriais)/ size(psoriais,1);
variance_Psoriasis = var(expectation_Psoriasis);
expectation_Seboreic = sum(seboreic)/ size(seboreic,1);
variance_Seboreic = var(expectation_Seboreic);
expectation_Lichen = sum(lichen)/ size(lichen,1);
variance_Lichen = var(expectation_Psoriasis);
expectation_ptyriasisRosea = sum(ptyriasisRosea)/ size(ptyriasisRosea,1);
variance_ptyriasisRosea = var(expectation_Psoriasis);
expectation_cronisdermatitis = sum(cronisdermatitis)/ size(cronisdermatitis,1);
variance_expectation_cronisdermatitis = var(expectation_cronisdermatitis);
expectation_pityriasisRubraPilaris = sum(pityriasisRubraPilaris)/ size(pityriasisRubraPilaris,1);
variance_pityriasisRubraPilaris = var(expectation_pityriasisRubraPilaris);



