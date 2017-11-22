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
for i = 1:size(y),
	if y(i) == 1,
		psoriasisCount++;
	end;
  if y(i) == 2,
		seboreicCount++;
	end;
  if y(i) == 3,
		lichenCount++;
	end;
  if y(i) == 4,
		pityriasisRoseaCount++;
	end; 
  if y(i) == 5,
		cronicdermatitisCount++;
	end;
  if y(i) == 6,
		pityriasisRubraPilarisCount++;
	end;
end;
prior_p_psoriasis = psoriasisCount / size(y, 1);
prior_p_seboreic = seboreicCount / size(y, 2);
prior_p_lichen = lichenCount / size(y, 3);
prior_p_pityriasisRosea = pityriasisRoseaCount / size(y, 4);
prior_p_cronicdermatitis = cronicdermatitisCount / size(y, 5);
prior_p_pityriasisRubraPilaris = pityriasisRubraPilarisCount / size(y, 6);