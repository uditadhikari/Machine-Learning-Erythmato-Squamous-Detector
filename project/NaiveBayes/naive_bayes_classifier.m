function prediction = naive_bayes_classifier(X, y, data)

prediction = zeros(size(data, 1), 1);

[expectation_Psoriasis, expectation_Seboreic, expectation_Lichen, expectation_ptyriasisRosea,expectation_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_Psoriasis,variance_Seboreic,variance_Lichen,variance_ptyriasisRosea,variance_cronisdermatitis,variance_pityriasisRubraPilaris] = compute_expectation_var(X, y);

[prior_p_psoriasis,prior_p_seboreic,prior_p_lichen,prior_p_pityriasisRosea,prior_p_cronicdermatitis,prior_p_pityriasisRubraPilaris]= compute_prior_p(y);


%disp("######### psoriraris prior probablitiy ##########") ,
%disp(prior_p_psoriasis)


%disp("######### seboreic prior probablitiy ##########") ,
%disp(prior_p_seboreic)

%disp("######### lichen prior probablitiy ##########") ,
%disp(prior_p_lichen)

%disp("######### pityriasisRosea prior probablitiy ##########") ,
%disp(prior_p_pityriasisRosea)

%disp("######### cronicdermatitis prior probablitiy ##########") ,
%disp(prior_p_cronicdermatitis)

%disp("######### pityriasisRubraPilaris prior probablitiy ##########") ,
%disp(prior_p_pityriasisRubraPilaris)




[posterior_p_psoriasis, posterior_p_seboreic, posterior_p_lichen, posterior_p_pityriasisRosea, posterior_p_cronicdermatitis, posterior_p_pityriasisRubraPilaris] = compute_posterior_p(data, expectation_Psoriasis,variance_Psoriasis, expectation_Seboreic,variance_Seboreic, expectation_Lichen, variance_Lichen,expectation_ptyriasisRosea,variance_ptyriasisRosea,expectation_cronisdermatitis,variance_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_pityriasisRubraPilaris);


%disp("######### psoriraris posterior probablitiy ##########") ,
%disp(posterior_p_psoriasis)


%disp("######### seboreic posterior probablitiy ##########") ,
%disp(posterior_p_seboreic)

%disp("######### lichen posterior probablitiy ##########") ,
%disp(posterior_p_lichen)

%disp("######### pityriasisRosea posterior probablitiy ##########") ,
%disp(posterior_p_pityriasisRosea)

%disp("######### cronicdermatitis posterior probablitiy ##########") ,
%disp(posterior_p_cronicdermatitis)

%disp("######### pityriasisRubraPilaris posterior probablitiy ##########") ,
%disp(posterior_p_pityriasisRubraPilaris)







%compute the posterior prabability of being psoriasis for each instance of data. This is done by 
%multiplying individual probablities of each attributes for each and every row . In essence this is the product of 
%likelihood * prior in the bayes rule.

p1 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_psoriasis(i, j)))
		  p1(i) = p1(i) * posterior_p_psoriasis(i, j);
    end;
	end;
	p1(i) = prior_p_psoriasis * p1(i);
end;

%compute the posterior prabability of being seboreic for each instance of data.

p2 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_seboreic(i, j)))
		  p2(i) = p2(i) * posterior_p_seboreic(i, j);
    end;
	end;
	p2(i) = prior_p_seboreic * p2(i);
end;


%compute the posterior prabability of being seboreic for each instance of data.

p3 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_lichen(i, j)))
		  p3(i) = p3(i) * posterior_p_lichen(i, j);
    end;
	end;
	p3(i) = prior_p_lichen * p3(i);
end;



%compute the posterior prabability of being pityriasisRosea for each instance of data.

p4 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_pityriasisRosea(i, j)))
		  p4(i) = p4(i) * posterior_p_pityriasisRosea(i, j);
    end;
	end;
	p4(i) = prior_p_pityriasisRosea * p4(i);
end;

%compute the posterior prabability of being cronicdermatitis for each instance of data.

p5 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_cronicdermatitis(i, j)))
		  p5(i) = p5(i) * posterior_p_cronicdermatitis(i, j);
     end;
	end;
	p5(i) = prior_p_cronicdermatitis * p5(i);
end;


%compute the posterior prabability of being pityriasisRubraPilaris for each instance of data.

p6 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
    if(!isnan(posterior_p_pityriasisRubraPilaris(i, j)))
		  p6(i) = p6(i) * posterior_p_pityriasisRubraPilaris(i, j);
    end;
	end;
	p6(i) = prior_p_pityriasisRubraPilaris * p6(i);
end;


%predict the output by picking the highest probabality 

#p1
#p2
#p3
#p4
#p5
#p6

for i = 1:size(data, 1),
  [x, ix] = max ([p1(i),p2(i),p3(i),p4(i),p5(i),p6(i)]);
	prediction(i) = ix;
end;


