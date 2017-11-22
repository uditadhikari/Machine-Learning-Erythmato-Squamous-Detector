% We have a total of six classes to classify our data set . So this function computes the frequency of each of those 
% classes. The classes are labelled as follows
%psoriasis,seboreic dermatitis,lichen planus,pityriasis rosea,cronic dermatitis,pityriasis rubra pilaris.

function [prior_p_psoriasis,prior_p_seboreic,prior_p_lichen,prior_p_pityriasisRosea,prior_p_cronicdermatitis,prior_p_pityriasisRubraPilaris] = compute_prior_p(y)
psoriasisCount = 0;
seboreicCount =0 ;
lichenCount =0;
pityriasisRoseaCount=0;
cronicdermatitisCount=0;
pityriasisRubraPilarisCount=0;

psoriasis_index = find(y == 1);
psoriasisCount = size(psoriasis_index, 1);

seboreic_index = find(y == 2);
seboreicCount = size(seboreic_index, 1);

lichen_index = find(y == 3);
lichenCount = size(lichen_index, 1);

ptyriasisRosea_index = find(y == 4);
pityriasisRoseaCount = size(ptyriasisRosea_index, 1);

cronisdermatitis_index = find(y == 5);
cronicdermatitisCount = size(cronisdermatitis_index, 1);

pityriasisRubraPilaris_index = find(y == 6);
pityriasisRubraPilarisCount = size(pityriasisRubraPilaris_index, 1);

total_count = size(y, 1)

prior_p_psoriasis = psoriasisCount / total_count;
prior_p_seboreic = seboreicCount / total_count;
prior_p_lichen = lichenCount / total_count;
prior_p_pityriasisRosea = pityriasisRoseaCount / total_count;
prior_p_cronicdermatitis = cronicdermatitisCount / total_count;
prior_p_pityriasisRubraPilaris = pityriasisRubraPilarisCount / total_count;