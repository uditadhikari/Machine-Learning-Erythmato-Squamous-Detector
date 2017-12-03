function result = vote(y)

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
  
  [count, index] = max ([psoriasisCount, seboreicCount, lichenCount, pityriasisRoseaCount, cronicdermatitisCount, pityriasisRubraPilarisCount]);
  
  result = index;