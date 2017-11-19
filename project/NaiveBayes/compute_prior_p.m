
function prior_p_true = compute_prior_p(y)
count = 0;
for i = 1:size(y),
	if y(i) == 1,
		count++;
	end;
end;
prior_p_true = count / size(y, 1);