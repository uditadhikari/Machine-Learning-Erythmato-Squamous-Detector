function [posterior_p_true,  posterior_p_false] = compute_posterior_p(X, expectTrue, varTrue, expectFalse, varFalse)
posterior_p_true = zeros(size(X));
posterior_p_false = zeros(size(X));
for i = 1:size(X,1),
	posterior_p_true(i, :) = 1 ./ ((2 * pi) .* varTrue).^ 0.5 .* exp(- ((X(i, :) - expectTrue) .^ 2) ./ (2 .* varTrue));
end;	
for i = 1:size(X,1),
	posterior_p_false(i, :) = 1 ./ ((2 * pi) .* varFalse).^ 0.5 .* exp(- ((X(i, :) - expectFalse) .^ 2) ./ (2 .* varFalse));
end;