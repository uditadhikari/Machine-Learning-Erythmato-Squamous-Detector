X = load('train instance');
y = load('train label');
DATA = load('test instance');
prediction = naive_bayes_classifier(X, y, DATA);
save prediction.mat prediction;