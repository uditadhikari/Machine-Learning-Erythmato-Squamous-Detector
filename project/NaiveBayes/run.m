train_data = load('train_instance.txt');

X = train_data(: , 1 : 34);
y = train_data(: , 35);


test_data = load('test_instance.txt');

%save prediction.mat prediction;

prediction = naive_bayes_classifier(X, y, test_data);