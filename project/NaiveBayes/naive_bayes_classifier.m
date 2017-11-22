function prediction = naive_bayes_classifier(X, y, data)

prediction = zeros(size(data, 1), 1);

[expectation_Psoriasis, expectation_Seboreic, expectation_Lichen, expectation_ptyriasisRosea,expectation_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_Psoriasis,variance_Seboreic,variance_Lichen,variance_ptyriasisRosea,variance_cronisdermatitis,variance_pityriasisRubraPilaris] = compute_expectation_var(X, y);

[prior_p_psoriasis,prior_p_seboreic,prior_p_lichen,prior_p_pityriasisRosea,prior_p_cronicdermatitis,prior_p_pityriasisRubraPilaris]= compute_prior_p(y);


disp("######### psoriraris prior probablitiy ##########") ,
disp(prior_p_psoriasis)


disp("######### seboreic prior probablitiy ##########") ,
disp(prior_p_seboreic)

disp("######### lichen prior probablitiy ##########") ,
disp(prior_p_lichen)

disp("######### pityriasisRosea prior probablitiy ##########") ,
disp(prior_p_pityriasisRosea)

disp("######### cronicdermatitis prior probablitiy ##########") ,
disp(prior_p_cronicdermatitis)

disp("######### pityriasisRubraPilaris prior probablitiy ##########") ,
disp(prior_p_pityriasisRubraPilaris)




[posterior_p_psoriasis,  posterior_p_seboreic,posterior_p_lichen,posterior_p_pityriasisRosea,posterior_p_cronicdermatitis,posterior_p_pityriasisRubraPilaris] = compute_posterior_p(data, expectation_Psoriasis,variance_Psoriasis, expectation_Seboreic,variance_Seboreic, expectation_Lichen, variance_Lichen,expectation_ptyriasisRosea,variance_ptyriasisRosea,expectation_cronisdermatitis,variance_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_pityriasisRubraPilaris);


disp("######### psoriraris posterior probablitiy ##########") ,
disp(prior_p_psoriasis)


disp("######### seboreic posterior probablitiy ##########") ,
disp(prior_p_seboreic)

disp("######### lichen posterior probablitiy ##########") ,
disp(prior_p_lichen)

disp("######### pityriasisRosea posterior probablitiy ##########") ,
disp(prior_p_pityriasisRosea)

disp("######### cronicdermatitis posterior probablitiy ##########") ,
disp(prior_p_cronicdermatitis)

disp("######### pityriasisRubraPilaris posterior probablitiy ##########") ,
disp(prior_p_pityriasisRubraPilaris)






% NEED TO FIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

%compute the posterior prabability of being true for each instance of data
#{
p1 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
		p1(i) = p1(i) * posterior_p_true(i, j);
	end;
	p1(i) = prior_p_true * p1(i);
end;
}#

%compute the posterior prabability of being fasle for each instance of data
#{
p2 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
		p2(i) = p2(i) * posterior_p_false(i, j);
	end;
	p2(i) = prior_p_false * p2(i);
end;
}#

%get the output
#{
for i = 1:size(data, 1),
	if p1(i) >= p2(i),
		prediction(i) = 1;
	else
		prediction(i) = -1;
	end;
end;
}#