function prediction = naive_bayes_classifier(X, y, data)

prediction = zeros(size(data, 1), 1);

[expectTrue, expectFalse, varTrue, varFalse] = compute_expect_var(X, y);

prior_p_true = compute_prior_p(y);
prior_p_false = 1 - prior_p_true;

[posterior_p_true,  posterior_p_false] = compute_posterior_p(data, expectTrue, varTrue, expectFalse, varFalse);

%compute the posterior prabability of being true for each instance of data
p1 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
		p1(i) = p1(i) * posterior_p_true(i, j);
	end;
	p1(i) = prior_p_true * p1(i);
end;

%compute the posterior prabability of being fasle for each instance of data
p2 = ones(size(data, 1), 1);
for i = 1:size(data, 1),
	for j = 1:size(data,2),
		p2(i) = p2(i) * posterior_p_false(i, j);
	end;
	p2(i) = prior_p_false * p2(i);
end;

%get the output
for i = 1:size(data, 1),
	if p1(i) >= p2(i),
		prediction(i) = 1;
	else
		prediction(i) = -1;
	end;
end;