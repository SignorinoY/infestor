clc, clear

n = 2000;
beta = [0, 1, 1.5]';

[X, y] = faker(n, beta, 1);

beta0 = [0; 0; 0];
MaxIter = 50;
epsilon = 1e-8;
betaHat = logisticRegression(X,y,beta0,MaxIter,epsilon)
