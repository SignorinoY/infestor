clc, clear

% Parameters
n = 200;
beta = [0, 1, 1.5]';
beta0 = [0; 0; 0];
repeat = 100;

% Simulation
bias = zeros(100, 3);
for seed = 1:repeat
    [X, y] = faker(n, beta, seed);
    betaHat = logisticRegression(X, y, beta0);
    bias(seed, :) = betaHat - beta;
end

% Estimated Result
mean(bias)
std(bias)