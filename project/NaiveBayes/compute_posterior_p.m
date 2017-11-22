function [posterior_p_psoriasis,  posterior_p_seboreic,posterior_p_lichen,posterior_p_pityriasisRosea,posterior_p_cronicdermatitis,posterior_p_pityriasisRubraPilaris] = compute_posterior_p(data, expectation_Psoriasis,variance_Psoriasis, expectation_Seboreic,variance_Seboreic, expectation_Lichen, variance_Lichen,expectation_ptyriasisRosea,variance_ptyriasisRosea,expectation_cronisdermatitis,variance_expectation_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_pityriasisRubraPilaris)
posterior_p_psoriasis = zeros(size(X));
posterior_p_seboreic = zeros(size(X));
posterior_p_lichen= zeros(size(X));
posterior_p_pityriasisRosea = zeros(size(X));
posterior_p_cronicdermatitis = zeros(size(X));
posterior_p_pityriasisRubraPilaris= zeros(size(X));


for i = 1:size(X,1),
	posterior_p_psoriasis(i, :) = 1 ./ ((2 * pi) .* variance_Psoriasis).^ 0.5 .* exp(- ((X(i, :) - expectation_Psoriasis) .^ 2) ./ (2 .* variance_Psoriasis));
end;	
for i = 1:size(X,1),
	posterior_p_seboreic(i, :) = 1 ./ ((2 * pi) .* variance_Seboreic).^ 0.5 .* exp(- ((X(i, :) - expectation_Seboreic) .^ 2) ./ (2 .* variance_Seboreic));
end;
for i = 1:size(X,1),
	posterior_p_lichen(i, :) = 1 ./ ((2 * pi) .* variance_Lichen).^ 0.5 .* exp(- ((X(i, :) - expectation_Lichen) .^ 2) ./ (2 .* variance_Lichen));
end;

for i = 1:size(X,1),
	posterior_p_pityriasisRosea(i, :) = 1 ./ ((2 * pi) .* variance_Lichen).^ 0.5 .* exp(- ((X(i, :) - expectation_Lichen) .^ 2) ./ (2 .* variance_Lichen));
end;

for i = 1:size(X,1),
	posterior_p_cronicdermatitis(i, :) = 1 ./ ((2 * pi) .* variance_Lichen).^ 0.5 .* exp(- ((X(i, :) - expectation_Lichen) .^ 2) ./ (2 .* variance_Lichen));
end;