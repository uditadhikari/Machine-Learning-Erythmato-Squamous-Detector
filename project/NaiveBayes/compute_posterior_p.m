function [posterior_p_psoriasis,  posterior_p_seboreic,posterior_p_lichen,posterior_p_pityriasisRosea,posterior_p_cronicdermatitis,posterior_p_pityriasisRubraPilaris] = compute_posterior_p(test_data, expectation_Psoriasis,variance_Psoriasis, expectation_Seboreic,variance_Seboreic, expectation_Lichen, variance_Lichen,expectation_ptyriasisRosea,variance_ptyriasisRosea,expectation_cronisdermatitis,variance_cronisdermatitis,expectation_pityriasisRubraPilaris,variance_pityriasisRubraPilaris)
posterior_p_psoriasis = zeros(size(test_data));
posterior_p_seboreic = zeros(size(test_data));
posterior_p_lichen= zeros(size(test_data));
posterior_p_pityriasisRosea = zeros(size(test_data));
posterior_p_cronicdermatitis = zeros(size(test_data));
posterior_p_pityriasisRubraPilaris= zeros(size(test_data));


for i = 1:size(test_data,1),
	posterior_p_psoriasis(i, :) = 1 ./ ((2 * pi) .* variance_Psoriasis).^ 0.5 .* exp(- ((test_data(i, :) - expectation_Psoriasis) .^ 2) ./ (2 .* variance_Psoriasis));
end;	
for i = 1:size(test_data,1),
	posterior_p_seboreic(i, :) = 1 ./ ((2 * pi) .* variance_Seboreic).^ 0.5 .* exp(- ((test_data(i, :) - expectation_Seboreic) .^ 2) ./ (2 .* variance_Seboreic));
end;
for i = 1:size(test_data,1),
	posterior_p_lichen(i, :) = 1 ./ ((2 * pi) .* variance_Lichen).^ 0.5 .* exp(- ((test_data(i, :) - expectation_Lichen) .^ 2) ./ (2 .* variance_Lichen));
end;

for i = 1:size(test_data,1),
	posterior_p_pityriasisRosea(i, :) = 1 ./ ((2 * pi) .* variance_ptyriasisRosea).^ 0.5 .* exp(- ((test_data(i, :) - expectation_ptyriasisRosea) .^ 2) ./ (2 .* variance_ptyriasisRosea));
end;

for i = 1:size(test_data,1),
	posterior_p_cronicdermatitis(i, :) = 1 ./ ((2 * pi) .* variance_cronisdermatitis).^ 0.5 .* exp(- ((test_data(i, :) - expectation_cronisdermatitis) .^ 2) ./ (2 .* variance_cronisdermatitis));
end;

for i = 1:size(test_data,1),
	posterior_p_pityriasisRubraPilaris(i, :) = 1 ./ ((2 * pi) .* variance_pityriasisRubraPilaris).^ 0.5 .* exp(- ((test_data(i, :) - expectation_pityriasisRubraPilaris) .^ 2) ./ (2 .* variance_pityriasisRubraPilaris));
end;




