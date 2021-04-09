clc, clear

n = 2000;
beta = [0, 1, 1.5]';

[Y, X] = faker(n, beta, 1);

initBeta = [0; 0; 0];
maxIter = 50;
epsilon = 1e-8;
betaHat = logisticRegression(Y,X,initBeta,maxIter,epsilon)
