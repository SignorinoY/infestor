clc, clear

% Parameters
n = 200;
repeat = 100;

%% With Intercept
% Parameters
beta = [0, 1, 1.5]';
beta0 = [0; 0; 0];

% Simulation
bias = zeros(repeat, 3);
for seed = 1:repeat
    [X, y] = faker(n, beta, seed);
    betaHat = logisticRegression(X, y, beta0, true);
    bias(seed, :) = betaHat - beta;
end

% Estimated Result
mean(bias)
std(bias)

%% Without Intercept
% Parameters
beta = [0, 1, 1.5]';
beta0 = [0; 0];

% Simulation
bias = zeros(repeat, 2);
for seed = 1:repeat
    [X, y] = faker(n, beta, seed);
    betaHat = logisticRegression(X, y, beta0, false);
    bias(seed, :) = betaHat - beta(2:3);
end

% Estimated Result
mean(bias)
std(bias)