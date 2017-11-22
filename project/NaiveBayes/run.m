X = load('train_instance.txt');
y = load('train_label.txt');
DATA = load('test_instance.txt');
prediction = naive_bayes_classifier(X, y, DATA);
%save prediction.mat prediction;